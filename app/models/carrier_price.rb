class CarrierPrice < ApplicationRecord
  belongs_to :carrier
  validates :band_name, :min_volume, :max_volume, :min_weight, :max_weight, :price, presence: true
end
