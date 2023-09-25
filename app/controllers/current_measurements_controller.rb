class CurrentMeasurementsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @current_measurements = CurrentMeasurement.all
    respond_to do |format|
      format.html
      format.csv do
        send_data @current_measurements.to_csv, type: 'text/csv', filename: 'current_measurements.csv'
      end
    end
  end

  def create
    @current_measurement = CurrentMeasurement.new(measurement_params)

    # Ermitteln des Stadtnamens basierend auf der IP-Adresse
    city_name = IPLocationService.get_city_name(request.remote_ip)

    # Überprüfen, ob ein Stadtname zurückgegeben wurde
    if city_name
      @current_measurement.location_based_on_ip = city_name
    else
      # Optional: Behandlung, wenn kein Stadtname gefunden wurde
      # Zum Beispiel: Setzen eines Standardwertes oder Protokollieren eines Fehlers
    end

    if @current_measurement.save
      render json: { status: 'success' }
    else
      render json: { status: 'error' }
    end
  end

  private

  def measurement_params
    params.require(:current_measurement).permit(:temperature, :humidity)
  end
end
