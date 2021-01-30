class AddRoleToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :string, null: false, default: 'guest'
    add_index :users, :role
  end
end
