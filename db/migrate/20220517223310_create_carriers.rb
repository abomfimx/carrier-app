class CreateCarriers < ActiveRecord::Migration[7.0]
  def change
    create_table :carriers do |t|
      t.string :brand_name
      t.string :corporate_name
      t.string :domain_name
      t.boolean :active_state
      t.string :registration_number
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
