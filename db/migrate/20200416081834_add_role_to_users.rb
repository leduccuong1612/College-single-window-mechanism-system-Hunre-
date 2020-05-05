class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :integer
    add_column :users, :staff_role, :integer
  end
end
