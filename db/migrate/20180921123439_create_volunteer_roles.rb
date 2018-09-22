class CreateVolunteerRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteer_roles do |t|
      t.references :volunteer, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
