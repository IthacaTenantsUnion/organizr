class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.integer :overall
      t.integer :repairs
      t.string :review

      t.timestamps
    end
  end
end
