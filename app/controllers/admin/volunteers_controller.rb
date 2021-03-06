class Admin::VolunteersController < ApplicationController
  if ENV['ADMIN_PASSWORD']
    http_basic_authenticate_with name: "decom", password: ENV['ADMIN_PASSWORD']
  end

  def index
    if params[:team_id] == 'none'
      @volunteers = Volunteer.all.select {|v| v.teams.count == 0}
    elsif params[:team_id]
      @team = Team.find(params[:team_id])
      @volunteers = @team.volunteers
    else
      @volunteers = Volunteer.all
    end
    respond_to do |format|
      format.html
      format.csv do
        require 'csv'
        @csv = CSV.generate do |csv|
          csv << @volunteers.first.attributes.keys + ['teams']
          @volunteers.each do |volunteer|
            csv << volunteer.attributes.values.collect{|x| x.to_s} + [volunteer.teams.collect(&:name).join(", ")]
          end
        end
        if @team
          send_data @csv, filename: "#{@team.name} Volunteers #{Time.now.to_s(:short)}.csv"
        else
          send_data @csv
        end
      end
    end
  end
end
