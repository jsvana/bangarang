class Server < ActiveRecord::Base
	validates :hostname, :domain, presence: true
	validates :ip, presence: true, format: { with: /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\/([1-3][0-9]|[1-9])$/i }

	has_one :status

	def self.update_statuses
		puts "[LOG] Updating server statuses..."

		servers = Server.all

		servers.each do |server|
			server.status.up = (`if ping -q -c1 #{server.hostname + "." + server.domain} > /dev/null; then echo up; else echo down; fi`).chomp! == "up"

			output = `nmap #{server.hostname + "." + server.domain} | grep open`
			ports = output.gsub(/([0-9]+)\/.*$/, '\1').split("\n")

			server.status.ports_open = ports.length
			server.status.ports = ports.join(',')

			server.status.save

			puts "[LOG] #{server.hostname} updated."
		end

		puts "[LOG] Update complete."
	end
end