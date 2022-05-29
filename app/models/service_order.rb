class ServiceOrder < ApplicationRecord
  enum status: { pending: 0, approved: 5, rejected: 10, delivered: 20 }
  belongs_to :carrier
  belongs_to :customer
  belongs_to :warehouse
  belongs_to :vehicule, optional: true
  belongs_to :product
  has_many :track_orders
  
  validates :placed_date, :status, :tracking_id, :distance, presence: true
  validates :tracking_id, uniqueness: true
  validates :tracking_id, length: { is: 15 }

  before_validation :generate_tracking_code

  private

  def generate_tracking_code
    if tracking_id.nil?
      self.tracking_id = SecureRandom.alphanumeric(15)
    end
  end
end
