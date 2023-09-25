class AddLocationBasedOnIpToCurrentMeasurements < ActiveRecord::Migration[7.0]
  def change
    add_column :current_measurements, :location_based_on_ip, :string
  end
end
