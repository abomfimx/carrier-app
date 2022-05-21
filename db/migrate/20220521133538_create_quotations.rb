class CreateQuotations < ActiveRecord::Migration[7.0]
  def change
    create_table :quotations do |t|
      t.date :quotation_date
      t.date :delivery_date
      t.integer :weight
      t.integer :height
      t.integer :width
      t.integer :depth
      t.integer :distance
      t.integer :shipping_price
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
