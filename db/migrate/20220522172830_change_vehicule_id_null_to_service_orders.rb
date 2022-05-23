class ChangeVehiculeIdNullToServiceOrders < ActiveRecord::Migration[7.0]
  def change
    change_column_null :service_orders, :vehicule_id, true
  end
end
