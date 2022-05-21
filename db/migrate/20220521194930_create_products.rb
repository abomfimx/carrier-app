class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :weight
      t.integer :height
      t.integer :width
      t.integer :depth
      t.string :sku

      t.timestamps
    end
  end
end
