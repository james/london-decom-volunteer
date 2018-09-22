class Team < ApplicationRecord
  has_many :volunteer_roles
  has_many :volunteers, through: :volunteer_roles
end
