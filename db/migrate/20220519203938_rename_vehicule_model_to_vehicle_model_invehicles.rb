class RenameVehiculeModelToVehicleModelInvehicles < ActiveRecord::Migration[7.0]
  def change
    rename_column :vehicules, :vehicule_model, :vehicle_model
  end
end
