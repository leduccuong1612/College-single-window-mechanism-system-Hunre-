class AddFieldUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role_id, :string
    add_column :users, :name, :string
    add_index :users, :role_id, unique: true
  end
end
