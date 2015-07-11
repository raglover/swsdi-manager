class EvaluationMailer < ActionMailer::Base
  default from: 'info@swsdi.org'

  def student_evaluation(recipient, camp_app)
    @user = camp_app.user
    @camp = camp_app.camp
    @camp_app = camp_app
    mail(to: recipient, subject: "#{@camp.name} - Student Evaluation for #{@user.full_name}")
  end

end