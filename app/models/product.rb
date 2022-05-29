class Product < ApplicationRecord
  validates :product_name, :weight, :width, :height, :depth, :sku, presence: true
  validates :sku, uniqueness: true
  validates  :weight, :width, :height, :depth, numericality: { greater_than: 0 }

  has_many :service_orders
end
