class Volunteer < ApplicationRecord
  has_many :volunteer_roles
  has_many :teams, through: :volunteer_roles
end
