class ChangeCarrierIdNullToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :carrier_id, true
  end
end
