class CreateForecasts < ActiveRecord::Migration[7.0]
  def change
    create_table :forecasts do |t|
      t.float :max_temperature
      t.float :min_temperature
      t.float :avg_humidity
      t.float :precipitation_probability
      t.float :wind_speed
      t.string :wind_direction
      t.datetime :timestamp

      t.timestamps
    end
  end
end
