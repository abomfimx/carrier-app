class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :code

      t.timestamps
    end
  end
end
