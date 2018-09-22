class VolunteerMailer < ApplicationMailer
  default from: 'volunteers@londondecom.org'

  def welcome_email
    @volunteer = params[:volunteer]
    mail(to: @volunteer.email, subject: 'Thank you for volunteering for London Decompression')
  end
end
