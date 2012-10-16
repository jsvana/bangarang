require 'net/ssh'

class Server < ActiveRecord::Base
	attr_accessible :domain, :ip, :hostname, :ip, :port
	attr_accessible :nickname, :username, :password, :is_media

	validates :domain, presence: true

	has_one :status
	has_many :status_data, through: :status
	has_many :disks

	def self.update_statuses
		puts "[LOG] Updating server statuses..."

		servers = Server.all

		servers.each do |server|
			server.status.up = (`if ping -q -c1 #{server} > /dev/null; then echo up; else echo down; fi`).chomp! == "up"

			server.ip = (`dig #{server} | grep -A 10 ';; ANSWER SECTION:' | grep -E '[[:space:]]+A[[:space:]]+' | awk '{ print $5; }'`).split("\n")[0]

			output = `nmap -p- #{server} | grep open`
			ports = output.gsub(/^(.*)open\ (.*)$/, '\1\2').split("\n")#.gsub(/([0-9]+)\/.*$/, '\1').split("\n")

			server.status.ports_open = ports.length
			server.status.ports = ports.join(',')

			begin
				Net::SSH.start(server.to_s, server.username, password: server.password, port: server.port, timeout: 5) do |ssh|
					stdout = ""

					ssh.exec!("uptime") do |channel, stream, data|
						stdout << data if stream == :stdout
					end
					if stdout.include?('day') || stdout.include?('days')
						if stdout.include?('min')
							data = stdout.gsub(/^.*up\s+(\d+)\s+days?,\s+(\d+)\s+min,\s+(\d+)\s+users?,\s+load\ average:\ ([\d.]+),\ ([\d.]+),\ ([\d.]+).*$/, '\1:\2:\3:\4:\5:\6:\7')

							data = data.split(":")
							server.status.uptime = "#{data[0]}:#{data[1]}:0"
							user_count = Integer(data[2])
							last_minute_load = Integer(Float(data[3]) * 100)
							last_five_load = Integer(Float(data[4]) * 100)
							last_fifteen_load = Integer(Float(data[5]) * 100)
						else
							data = stdout.gsub(/^.*up\s+(\d+)\s+days?,\s+(\d+):(\d+),\s+(\d+)\s+users?,\s+load\ average:\ ([\d.]+),\ ([\d.]+),\ ([\d.]+).*$/, '\1:\2:\3:\4:\5:\6:\7')

							data = data.split(":")
							server.status.uptime = "#{data[0]}:#{data[1]}:#{data[2]}"
							user_count = Integer(data[3])
							last_minute_load = Integer(Float(data[4]) * 100)
							last_five_load = Integer(Float(data[5]) * 100)
							last_fifteen_load = Integer(Float(data[6]) * 100)
						end
					else
						data = stdout.gsub(/^.*up\s+(\d+):(\d+),\s+(\d+)\s+users?,\s+load\ average:\ ([\d.]+),\ ([\d.]+),\ ([\d.]+).*$/, '\1:\2:\3:\4:\5:\6:\7')

						data = data.split(":")
						server.status.uptime = "0:#{data[0]}:#{data[1]}"
						user_count = Integer(data[2])
						last_minute_load = Integer(Float(data[3]) * 100)
						last_five_load = Integer(Float(data[4]) * 100)
						last_fifteen_load = Integer(Float(data[5]) * 100)
					end

					stdout = ""

					ssh.exec!("free -m | grep Mem: | awk '{ print $2,$3,$4; }'") do |channel, stream, data|
						stdout << data if stream == :stdout
					end

					data = stdout.split(" ")

					total_memory = Integer(data[0])
					used_memory = Integer(data[1])
					free_memory = Integer(data[2])

					server.status.status_data.create(user_count: user_count,
						last_minute_load: last_minute_load,
						last_five_load: last_five_load,
						last_fifteen_load: last_fifteen_load,
						total_memory: total_memory,
						free_memory: free_memory,
						used_memory: used_memory)

					stdout = ""

					ssh.exec!("ip addr | grep -A 1 eth0 | awk '{ print $2; }' | tail -n 3") do |channel, stream, data|
						stdout << data if stream == :stdout
					end

					data = stdout.split("\n")

					server.status.mac_address = data[0]
					server.status.ip = data[1]
					server.status.ip6 = data[2]

					server.disks.delete_all

					stdout = ""

					ssh.exec!("df -h | grep sd") do |channel, stream, data|
						stdout << data if stream == :stdout
					end

					puts stdout

					stdout.split("\n").each do |datum|
						info = datum.gsub(/^(.+?)\s+(.+?)\s+(.+?)\s+(.+?)\s+(\d+)%\s+(.+?)\s*$/, '\1:\2:\3:\4:\5:\6')
						data = info.split(':')

						server.disks.create(
							name: data[0], size: data[1], space_used: data[2],
							space_available: data[3], percent_used: Integer(data[4]),
							mount_point: data[5]
						)
					end
				end
			rescue Exception => e
				puts "[LOG] Could not SSH into #{server} (error: #{e.message})"
			end

			server.save
			server.status.save

			puts "[LOG] #{server} updated."
		end

		puts "[LOG] Update complete."
	end

	def is_media?
		self.is_media
	end

	def user
		if self.username
			self.username
		else
			APP_CONFIG['ssh']['username']
		end
	end

	def pass
		if self.password
			self.password
		else
			APP_CONFIG['ssh']['password']
		end
	end

	def to_s
		if self.hostname.length > 0
			self.hostname + "." + self.domain
		else
			self.domain
		end
	end

	def display_name
		if self.nickname
			"#{self.nickname} (#{self})"
		else
			self
		end
	end
end
