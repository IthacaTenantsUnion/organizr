class CreateRawReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :raw_reviews do |t|
      t.text :landlord_public_review
      t.text :landlord_private_review
      t.integer :landlord_general_rating
      t.integer :landlord_repairs_rating
      t.string :security_deposit
      t.date :lease_end_date
      t.string :landlord_name
      t.string :property_manager
      t.string :submitter_ip_address
      t.string :preferred_contact
      t.integer :rent

      t.timestamps
    end
  end
end
