class ServiceOrder < ApplicationRecord
  enum status: { Pendente: 0, Aprovado: 5, Reprovado: 10, Finalizado: 20 }
  belongs_to :carrier
  belongs_to :customer
  belongs_to :warehouse
  belongs_to :vehicule, optional: true
  belongs_to :product
  validates :placed_date, :status, :tracking_id, :distance, presence: true
  validates :tracking_id, uniqueness: true
  validates :tracking_id, length: { is: 15 }
end
