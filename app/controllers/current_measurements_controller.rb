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
    @current_measurements = CurrentMeasurement.order(created_at: :desc).paginate(page: params[:page], per_page: 30)
    @temperatures = CurrentMeasurement.where("created_at >= ?", Date.today.beginning_of_day).order(:created_at).pluck(:temperature)
    @timestamps = CurrentMeasurement.where("created_at >= ?", Date.today.beginning_of_day).order(:created_at).pluck(:created_at)
    @temperatures_week = []
    @timestamps_week = []
    (1..7).each do |day_ago|
      day = Date.today - day_ago.days
      %w[06:00 12:00 20:00 24:00].each do |time|
        hour, minute = time.split(':').map(&:to_i)
        closest_measurement = CurrentMeasurement.where("created_at >= ?", day.to_time.change(hour: hour, min: minute))
                                              .order(:created_at)
                                              .first
        if closest_measurement
          @temperatures_week << closest_measurement.temperature
          @timestamps_week << closest_measurement.created_at
        end
      end
    end
    # Daten für das Gesamtdiagramm
    @temperatures_all = CurrentMeasurement.order(:created_at).pluck(:temperature)
    @timestamps_all = CurrentMeasurement.order(:created_at).pluck(:created_at)
  end

  def create
    @current_measurement = CurrentMeasurement.new(measurement_params)
    city_name = IpLocationService.get_city_name(request.remote_ip)

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
