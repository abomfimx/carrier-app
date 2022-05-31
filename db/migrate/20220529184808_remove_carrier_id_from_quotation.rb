class RemoveCarrierIdFromQuotation < ActiveRecord::Migration[7.0]
  def change
    remove_reference :quotations, :carrier, index: true, foreign_key: true
  end
end
