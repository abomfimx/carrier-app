class CreateQuotationDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :quotation_details do |t|
      t.date :delivery_date
      t.integer :shipping_price
      t.references :carrier, null: false, foreign_key: true
      t.references :quotation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
