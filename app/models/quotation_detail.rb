class QuotationDetail < ApplicationRecord
  belongs_to :carrier
  belongs_to :quotation

  def self.execute_sql(*sql_array)
    connection.execute(send(:sanitize_sql_array, sql_array))
  end
end
