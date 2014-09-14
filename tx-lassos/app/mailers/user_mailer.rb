class UserMailer < ActionMailer::Base
  default from: 'txlassos@gmail.com'
 
	def signup_confirmation(user)
	  mail to: user, subject: "Sign Up Confirmation"
	end

end