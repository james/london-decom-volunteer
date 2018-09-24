class VolunteersController < ApplicationController
  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      VolunteerMailer.with(volunteer: @volunteer).welcome_email.deliver_now
      render template: 'volunteers/success'
    else
      render action: :new
    end
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name, :email, :phone, :other_offers, team_ids: [])
  end
end
