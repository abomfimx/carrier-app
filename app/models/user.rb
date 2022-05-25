class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :carrier, optional: true
  before_save :set_admin_and_carrier

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private
  
  def set_admin_and_carrier
    domain_list = Carrier.where(active_state: true).collect(&:domain_name)
    user_domain = email.split('@')[1]

    if domain_list.include?(user_domain)
      v_carrier = Carrier.find_by_domain_name(user_domain)
      self.carrier_id = v_carrier.id
    end

    if user_domain == 'sistemadefrete.com.br'
      self.admin = true
    end
  end
end
