class RegistrationMailer < ActionMailer::Base
	default from: 'info@swsdi.org'

	def student_email(user, camp)
		@user = user
		@camp = camp
		@url = 'http://file.download.link'
		mail(to: @user.email, 
			subject: "Thank you for registering for #{@camp.name} - Next Steps")
	end

	def parent_email(user, camp)
		@user = user
		@camp = camp
		@url = 'http://file.download.link'
		mail(to: @user.parent_email, 
			subject: "Your Student #{@user.first_name} has registered for #{@camp.name} - Next Steps")
	end

	def coach_email(user, camp)
		@user = user
		@camp = camp
		@url = 'http://file.download.link'
		mail(to: @user.email, 
			subject: "Your Student #{@user.first_name} has registered for #{@camp.name} - Next Steps")
	end

	def admin_email(user, camp)
		@user = user
		@camp = camp
		mail(to: "Susan Seep <sseep@swsdi.org>, Richie Glover <rglover@swsdi.org>", 
			subject: "New Application submitted for #{@camp.name} - #{@user.first_name} #{@user.last_name}")
	end

end