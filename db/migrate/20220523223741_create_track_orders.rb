class CreateTrackOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :track_orders do |t|
      t.date :tracking_date
      t.string :location
      t.string :comments
      t.references :service_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
