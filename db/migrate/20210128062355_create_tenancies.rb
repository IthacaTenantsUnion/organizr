class CreateTenancies < ActiveRecord::Migration[6.0]
  def change
    create_table :tenancies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.references :landlord, null: false, foreign_key: true
      t.integer :rent
      t.date :start_date
      t.date :end_date
      t.integer :overall
      t.integer :repairs
      t.string :review

      t.timestamps
    end
  end
end
