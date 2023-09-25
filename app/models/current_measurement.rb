# app/models/current_measurement.rb

class CurrentMeasurement < ApplicationRecord
  # ... Ihre anderen Methoden und Beziehungen ...

  def self.to_csv
    attributes = %w{id temperature humidity created_at updated_at} # Spalten, die Sie exportieren möchten

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |measurement|
        csv << attributes.map { |attr| measurement.send(attr) }
      end
    end
  end
end
