class AdminMailer < ActionMailer::Base
	default from: "txlassos@gmail.com"
	email_array = []

	def find_admin(user)
		@users = User.all
		@users.each do |user|
			if user.admin
				email_array << user.email
			end
		end
	end

	def new_registrant
		email_array.each do |i|
			mail(to: i, subject: 'test admin email')
		end
	end
end

