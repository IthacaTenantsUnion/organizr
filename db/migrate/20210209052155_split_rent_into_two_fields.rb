class SplitRentIntoTwoFields < ActiveRecord::Migration[6.0]
  def change
    rename_column :tenancies, :rent, :rent_total
    add_column :tenancies, :rent_portion, :integer
  end
end
