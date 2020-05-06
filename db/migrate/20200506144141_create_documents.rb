class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :content
      t.boolean :form, default: false
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
