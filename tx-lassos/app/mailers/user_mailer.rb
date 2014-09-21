class UserMailer < ActionMailer::Base
  default from: 'admin@lassoalumni.org'
 
	def signup_confirmation(user)
	  mail to: user, subject: "Sign Up Confirmation"
	end

end