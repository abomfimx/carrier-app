class CreateCarrierPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :carrier_prices do |t|
      t.string :band_name
      t.integer :min_volume
      t.integer :max_volume
      t.integer :min_weight
      t.integer :max_weight
      t.integer :price
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
