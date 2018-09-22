class Admin::VolunteersController < ApplicationController
  if ENV['ADMIN_PASSWORD']
    http_basic_authenticate_with name: "decom", password: ENV['ADMIN_PASSWORD']
  end

  def index
    if params[:team_id]
      @volunteers = Team.find(params[:team_id]).volunteers
    else
      @volunteers = Volunteer.all
    end
  end
end
