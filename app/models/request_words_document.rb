class RequestWordsDocument < ApplicationRecord
  after_create :convert_pdfs
  belongs_to :user, optional: true
  belongs_to :words_document, optional: true
  delegate :name, to: :user, prefix: :user
  has_one_attached :words
  has_one_attached :pdfs
  enum status: [:waiting, :pass, :fail, :checked]
  enum result: [:success, :error]
  scope :select_status, ->(status){where "status LIKE ?", "#{status}"}
  scope :order_desc, ->{order created_at: :desc}

  # def days_till_expiration(request)
  #   (Time.now - request.created_at).to_i / 1.day
  # end
  def convert_pdfs
    Libreconv.convert(ActiveStorage::Blob.service.send(:path_for,self.words.key),"public/pdfs/test.pdf")
    self.pdfs.attach(io: File.open("public/pdfs/test.pdf"), filename: 'file.pdf')
  end
end


