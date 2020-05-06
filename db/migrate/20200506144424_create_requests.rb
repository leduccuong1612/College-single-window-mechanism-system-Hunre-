class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true
      t.string :form_stuff
      t.text :student_content
      t.text :manager_content
      t.text :staff_content
      t.integer :status, default: 0
      t.integer :result, null: true

      t.timestamps
    end
  end
end
