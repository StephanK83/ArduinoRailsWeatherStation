class CreateCurrentMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :current_measurements do |t|
      t.float :temperature
      t.float :humidity
      t.float :pressure
      t.float :wind_speed
      t.string :wind_direction
      t.float :rainfall

      t.timestamps
    end
  end
end
