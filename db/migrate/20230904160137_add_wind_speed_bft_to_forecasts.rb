class AddWindSpeedBftToForecasts < ActiveRecord::Migration[7.0]
  def change
    add_column :forecasts, :wind_speed_bft, :integer
  end
end
