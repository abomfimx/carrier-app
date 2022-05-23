class RenamePlacedOrderToPlacedDate < ActiveRecord::Migration[7.0]
  def change
    rename_column :service_orders, :placed_order, :placed_date
  end
end
