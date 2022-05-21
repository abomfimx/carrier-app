class Quotation < ApplicationRecord
  belongs_to :carrier
  validates :quotation_date, :delivery_date, :weight, :height, :width, :depth, :distance, :shipping_price, presence: true
  validates :delivery_date, comparison: { greater_than: :quotation_date }
end
