class Vehicule < ApplicationRecord
  belongs_to :carrier
  validates :plate_number, :brand_name, :vehicle_model, :year, :max_load, presence: true
  validates :plate_number, uniqueness: true
end
