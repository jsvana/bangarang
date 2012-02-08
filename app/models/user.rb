class User < ActiveRecord::Base
	validates :name, presence: true
	validates :password, :password_confirmation, presence: true, if: :admin?
	validates :username, presence: true, uniqueness: true, format: { with: /^[a-z0-9_\-@\.]*$/i }
	validates :email, presence: true, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

	attr_accessible :name, :password, :password_confirmation, :username, :email, :approved, :admin
	has_secure_password

	private

	def admin?
		defined? current_user && (!current_user || !current_user.admin)
	end
end