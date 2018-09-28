class Team < ApplicationRecord
  has_many :volunteer_roles, dependent: :destroy
  has_many :volunteers, through: :volunteer_roles
end
