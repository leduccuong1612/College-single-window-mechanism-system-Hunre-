class Document < ApplicationRecord
  belongs_to :department
  delegate :name, to: :department, prefix: :department
  has_one :documents  
  has_one_attached :words
  DEPARTMENTS = ["Công Tác sinh Viên", "Đào Tạo", "Tài Chính - Kế Toán", "Y Tế", "Cơ Sở Vật Chất"]
end
