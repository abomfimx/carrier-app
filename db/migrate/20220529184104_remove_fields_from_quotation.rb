class RemoveFieldsFromQuotation < ActiveRecord::Migration[7.0]
  def change
    remove_column :quotations, :delivery_date, :date
    remove_column :quotations, :shipping_price, :integer
  end
end
