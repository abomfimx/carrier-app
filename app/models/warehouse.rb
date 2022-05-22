class Warehouse < ApplicationRecord
  validates :name, :address, :city, :state, :code, presence: true
  validates :name, uniqueness: true
  validates :code, uniqueness: true
  validates :code, length: { is: 3 }

end
