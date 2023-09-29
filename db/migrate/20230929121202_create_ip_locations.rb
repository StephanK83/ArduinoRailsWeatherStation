class CreateIpLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :ip_locations do |t|
      t.string :ip
      t.string :location
      t.date :last_updated

      t.timestamps
    end
  end
end
