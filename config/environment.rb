# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bangarang::Application.initialize!

#ActionMailer::Base.smtp_settings = {
#	address: 'smtp.gmail.com',
#	port: 587,
#	domain: 'gmail.com',
#	user_name: 'jaysvana',
#	password: 'LinKeD2736',
#	authentication: 'plain',
#	enable_starttls_auto: false
#}
ActiveRecord::Base.pluralize_table_names = false
