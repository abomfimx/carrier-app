class DeliveryPeriod < ApplicationRecord
  belongs_to :carrier
  validates :band_name, :min_distance, :max_distance, :days, presence: true
end
