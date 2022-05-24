class TrackOrder < ApplicationRecord
  belongs_to :service_order
  validates :tracking_date, :location, :comments, presence: true
end
