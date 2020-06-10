class AddFieldUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :login_name, :string
    add_column :users, :name, :string
    add_index :users, :login_name, unique: true
  end
end
