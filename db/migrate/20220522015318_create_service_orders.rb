class CreateServiceOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_orders do |t|
      t.date :placed_order
      t.string :tracking_id
      t.integer :distance
      t.references :carrier, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true
      t.references :vehicule, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
