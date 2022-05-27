class Customer < ApplicationRecord
  validates :name, :address, :city, :state, :cpf, :email, presence: true
  validates :cpf, uniqueness: true
  validates :cpf, length: { is: 11 }

  def extended_description
    "#{name} - CPF #{cpf}"
  end
end
