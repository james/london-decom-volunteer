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
    respond_to do |format|
      format.html
      format.csv do
        require 'csv'
        @csv = CSV.generate do |csv|
          csv << @volunteers.first.attributes.keys
          @volunteers.each do |volunteer|
            csv << volunteer.attributes.values.collect{|x| x.to_s}
          end
        end
        send_data @csv
      end
    end
  end
end
