class AddOtherToVolunteers < ActiveRecord::Migration[5.2]
  def change
    add_column :volunteers, :other_offers, :text
  end
end
