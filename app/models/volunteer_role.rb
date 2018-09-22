class VolunteerRole < ApplicationRecord
  belongs_to :volunteer
  belongs_to :team
end
