class AddRaceAndGenderToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :race, :string
    add_column :users, :gender, :string
  end
end
