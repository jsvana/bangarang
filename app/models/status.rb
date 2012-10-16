class Status < ActiveRecord::Base
	attr_accessible :server_id, :up, :ports_open, :ports, :uptime, :local_ip

	belongs_to :server
	has_many :status_data

	def uptime_tos
		if self.uptime && self.uptime.length > 0
			data = self.uptime.split(":")

			if data[0] == '0'
				days = '0 days'
			else
				data[0].sub!(/^0+/, "")

				days = "#{data[0]} day#{data[0] != "1" ? 's' : ''}"
			end

			if data[1] == '0'
				hours = '0 hours'
			else
				data[1].sub!(/^0+/, "")

				hours = "#{data[1]} hour#{data[1] != "1" ? 's' : ''}"
			end

			if data[2] == '0'
				minutes = '0 minutes'
			else
				data[2].sub!(/^0+/, "")

				minutes = "#{data[2]} minute#{data[2] != "1" ? 's' : ''}"
			end

			"#{days}, #{hours}, #{minutes}"
		else
			"Unknown"
		end
	end
end
