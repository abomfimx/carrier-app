class Carrier < ApplicationRecord
  validates :brand_name, :corporate_name, :domain_name, :address, :registration_number, :city, :state, presence: true
  validates :registration_number, uniqueness: true
  validates :registration_number, length: { is: 14 }
  has_many :vehicules
end
