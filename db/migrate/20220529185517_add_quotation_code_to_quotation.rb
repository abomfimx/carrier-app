class AddQuotationCodeToQuotation < ActiveRecord::Migration[7.0]
  def change
    add_column :quotations, :quotation_code, :string
  end
end
