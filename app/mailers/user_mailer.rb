class UserMailer < ApplicationMailer
	default from: 'samirlama509@gmail.com'
	def welcome_email(user)
		@user = user
		@url = 'http://example.com/login'
		mail(to: @user.email , subject: 'Welcome to my awesome site' )
	end	
end
