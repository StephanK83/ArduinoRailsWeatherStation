class AddWindSpeedBftToMeasurements < ActiveRecord::Migration[7.0]
  def change
    add_column :measurements, :wind_speed_bft, :integer
  end
end
