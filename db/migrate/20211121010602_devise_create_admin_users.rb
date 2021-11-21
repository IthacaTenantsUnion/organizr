# frozen_string_literal: true

class DeviseCreateAdminUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :full_name
      t.string :uid
      t.string :avatar_url

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :admin_users, :email,                unique: true
  end
end
