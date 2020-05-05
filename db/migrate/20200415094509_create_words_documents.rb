class CreateWordsDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :words_documents do |t|
      t.string :title
      t.text :content
      t.string :department
      t.timestamps
    end
  end
end
