class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.string :lead

      t.timestamps
    end
  end
end
