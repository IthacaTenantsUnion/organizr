class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      t.string :address
      t.references :landlord, null: false, foreign_key: true

      t.timestamps
    end
  end
end
