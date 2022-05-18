class ChangeActiveStateDefaultToCarriers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :carriers, :active_state, from: nil, to: true
  end
end
