class CreateLeases < ActiveRecord::Migration[6.0]
  def change
    create_table :leases do |t|
      t.integer :user_id
      t.integer :unit_id
      t.integer :landlord_id
      t.integer :rent_portion
      t.integer :rent_total
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
