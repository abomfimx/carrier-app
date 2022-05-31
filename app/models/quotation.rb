class Quotation < ApplicationRecord
  # belongs_to :carrier
  has_many :quotation_details
  validates :quotation_date, :weight, :height, :width, :depth, :distance, presence: true
  # validates :delivery_date, comparison: { greater_than: :quotation_date }

  before_validation :generate_quotation_code

  def generate_quotation_code
    if quotation_code.nil?
      self.quotation_code = SecureRandom.alphanumeric(8)
    end
  end
end
