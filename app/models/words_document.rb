class WordsDocument < ApplicationRecord
  has_one :request_words_documents  
  has_one_attached :words
  DEPARTMENTS = ["Công Tác sinh Viên", "Đào Tạo", "Tài Chính - Kế Toán", "Y Tế", "Cơ Sở Vật Chất"]
end
