require 'net/ssh'

class Server < ActiveRecord::Base
	validates :domain, presence: true
	validates :ip, presence: true, format: { with: /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\/([1-3][0-9]|[1-9])$/i }

	has_one :status

	def self.update_statuses
		puts "[LOG] Updating server statuses..."

		servers = Server.all

		servers.each do |server|
			server.status.up = (`if ping -q -c1 #{server} > /dev/null; then echo up; else echo down; fi`).chomp! == "up"

			output = `nmap #{server} | grep open`
			ports = output.gsub(/^(.*)open\ (.*)$/, '\1\2').split("\n")#.gsub(/([0-9]+)\/.*$/, '\1').split("\n")

			server.status.ports_open = ports.length
			server.status.ports = ports.join(',')

			begin
				Net::SSH.start(server.to_s, 'ruby', password: 'gem', timeout: 2) do |ssh|
					stdout = ""
					ssh.exec!("uptime") do |channel, stream, data|
						stdout << data if stream == :stdout
					end
					data = stdout.gsub(/^.*up\s+(\d+)\s+days?,\s+(\d+):(\d+),\s+(\d+)\s+users?,\s+load\ average:\ ([\d.]+),\ ([\d.]+),\ ([\d.]+).*$/, '\1:\2:\3:\4:\5:\6:\7')

					data = data.split(":")

					uptime = "#{data[0]}:#{data[1]}:#{data[2]}"
					users = "#{data[3]}"
					load = "#{data[4]}:#{data[5]}:#{data[6]}"

					server.status.uptime = uptime

					#puts "[LOG] #{uptime}"
					#puts "[LOG] #{users}"
					#puts "[LOG] #{load}"
				end
			rescue
				puts "[LOG] Could not SSH into #{server}"
			end

			server.status.save

			puts "[LOG] #{server} updated."
		end

		puts "[LOG] Update complete."
	end

	def to_s
		if self.hostname.length > 0
			self.hostname + "." + self.domain
		else
			self.domain
		end
	end
end