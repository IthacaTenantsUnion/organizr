class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :unit_id
      t.integer :landlord_id
      t.integer :overall
      t.integer :repairs
      t.string :public_review
      t.string :private_review

      t.timestamps
    end
  end
end
