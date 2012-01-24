class UserMailer < ActionMailer::Base
  default from: "jaysvana@gmail.com"

  def admin_email(user)
  	@user = user
  	mail(to: 'jsvana@mtu.edu', subject: "#{user.username} wants to be added to the server")
  end
end
