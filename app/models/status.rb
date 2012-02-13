class Status < ActiveRecord::Base
	belongs_to :server
	has_many :status_data, order: 'created_at DESC', limit: 10

	def uptime_tos
		if self.uptime && self.uptime.length > 0
			data = self.uptime.split(":")

			data[0].sub!(/^0+/, "")

			days = "#{data[0]} day#{data[0] != "1" ? 's' : ''}"

			data[1].sub!(/^0+/, "")

			hours = "#{data[1]} hour#{data[1] != "1" ? 's' : ''}"

			data[2].sub!(/^0+/, "")

			minutes = "#{data[2]} minute#{data[2] != "1" ? 's' : ''}"

			"#{days}, #{hours}, #{minutes}"
		else
			"Unknown"
		end
	end
end
