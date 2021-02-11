class AddBuildingTypeToUnit < ActiveRecord::Migration[6.0]
  def change
    add_column :units, :building_type, :string
  end
end
