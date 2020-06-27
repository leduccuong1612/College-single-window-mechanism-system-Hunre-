class Request < ApplicationRecord
  
  belongs_to :user, optional: true
  belongs_to :document, optional: true

  delegate :name, to: :user, prefix: :user

  has_one_attached :files
  has_one_attached :pdfs
  has_one_attached :extends

  validates :department_id, presence: true
  validates :document_id, presence: true

  enum status: [:waiting, :pass, :fail, :checked, :done, :outdate] 
  enum result: [:success, :error]
  scope :select_checked_request, ->(department){where "status LIKE 3 AND department_id LIKE ?", department} 
  scope :select_staff_request, ->(department){where "status LIKE 1 AND department_id LIKE ?", department} 
  scope :select_status, ->(status){where "status LIKE ?", status}
  scope :order_desc, ->{order created_at: :desc}

end
