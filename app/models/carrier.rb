class Carrier < ApplicationRecord
  validates :brand_name, :corporate_name, :domain_name, :address, :registration_number, :city, :state, presence: true
  validates :registration_number, uniqueness: true
  validates :registration_number, length: { is: 14 }
  has_many :vehicules
  has_many :service_orders
  has_many :quotation_details
  has_many :carrier_prices
  has_many :delivery_periods
  has_many :users


  def extended_description
    "#{brand_name} - CNPJ #{registration_number}"
  end
end
