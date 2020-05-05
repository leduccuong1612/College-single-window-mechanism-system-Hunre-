class CreateRequestWordsDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :request_words_documents do |t|
      t.references :user, null: false, foreign_key: true
      t.references :words_document, null: true, foreign_key: true
      t.string :form_stuff
      t.string :student_content
      t.string :manager_content
      t.string :staff_content
      t.integer :status, default: 0
      t.integer :result, null: true
      t.timestamps
    end
  end
end
