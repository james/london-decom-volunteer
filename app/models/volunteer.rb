class Volunteer < ApplicationRecord
  has_many :volunteer_roles, dependent: :destroy
  has_many :teams, through: :volunteer_roles
end
