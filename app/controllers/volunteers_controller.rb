class VolunteersController < ApplicationController
  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      redirect_to success_volunteers_path
    else
      render action: :new
    end
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name, :email, :phone, team_ids: [])
  end
end
