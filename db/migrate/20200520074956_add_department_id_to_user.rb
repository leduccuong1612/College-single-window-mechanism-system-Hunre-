class AddDepartmentIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :department, null: true, foreign_key: true
  end
end
