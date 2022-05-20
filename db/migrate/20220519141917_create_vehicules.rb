class CreateVehicules < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicules do |t|
      t.string :plate_number
      t.string :brand_name
      t.string :vehicule_model
      t.string :year
      t.integer :max_load
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
