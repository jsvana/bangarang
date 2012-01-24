class User < ActiveRecord::Base
	validates :first_name, :last_name, presence: true
	validates :password, presence: true, confirmation: true
	validates :username, presence: true, uniqueness: true, format: { with: /^[a-z0-9_\-@\.]*$/i }
	validates :email, presence: true, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
end
