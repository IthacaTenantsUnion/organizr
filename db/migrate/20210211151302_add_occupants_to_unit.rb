class AddOccupantsToUnit < ActiveRecord::Migration[6.0]
  def change
    add_column :units, :number_of_occupants, :integer, default: 1
  end
end
