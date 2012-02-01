class UserMailer < ActionMailer::Base
  default from: "jaysvana@gmail.com"

  def admin_email(user)
  	@user = user
  	mail(to: 'jaysvana@gmail.com', subject: "#{user.username} wants to be added to the server")
  end
end
