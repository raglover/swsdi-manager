class RegistrationMailer < ActionMailer::Base
	default from: 'info@swsdi.org'

	def student_email(user, camp)
		@user = user
		@camp = camp
		@url = 'https://register.swsdi.org/documents/returnpacket2015.pdf'
		mail(to: @user.email, 
			subject: "Thank you for registering for #{@camp.name} - Next Steps")
	end

	def parent_email(user, camp)
		@user = user
		@camp = camp
		@url = 'https://register.swsdi.org/documents/returnpacket2015.pdf'
		mail(to: @user.parent_email, 
			subject: "Your Student #{@user.first_name} has registered for #{@camp.name} - Next Steps")
	end

	def coach_email(user, camp, app)
		@user = user
		@camp = camp
		@id = app.uuid
		@url = "https://register.swsdi.org/coach_comments/new/?id=#{@id}"
		mail(to: @user.coach_email, 
			subject: "Your Student #{@user.first_name} has registered for #{@camp.name} - Next Steps")
	end

	def admin_email(user, camp)
		@user = user
		@camp = camp
		mail(to: "Susan Seep <susan@swsdi.org>, Richie Glover <richard@swsdi.org>", 
			subject: "New Application submitted for #{@camp.name} - #{@user.first_name} #{@user.last_name}")
	end

	def verification_email(user, camp, camp_app)
		@user = user
		@camp = camp
		@camp_app = camp_app
		mail(to: [@user.email, @user.parent_email],
			subject: "#{@user.first_name}'s #{@camp.name} Registration has been verified!")
	end

	def reminder_email(user, camp)
		@user = user
		@camp = camp
		mail(to: @user.email,
			subject: "#{@user.first_name}, Please finish registering for SWSDI!")
	end

end