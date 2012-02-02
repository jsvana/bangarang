class Admin < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, on: :create
end