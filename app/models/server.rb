class Server < ActiveRecord::Base
	validates :hostname, :domain, presence: true
	validates :ip, presence: true, format: { with: /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\/([1-3][0-9]|[1-9])$/i }

	has_one :status
end