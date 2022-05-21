class CreateDeliveryPeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_periods do |t|
      t.string :band_name
      t.integer :min_distance
      t.integer :max_distance
      t.integer :days
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
