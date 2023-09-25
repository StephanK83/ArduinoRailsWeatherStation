class CurrentMeasurementsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @current_measurements = CurrentMeasurement.all

    respond_to do |format|
      format.html # standardmäßig, zeigt die HTML-View
      format.csv { send_data @current_measurements.to_csv, filename: "current_measurements-#{Date.today}.csv" }
    end
  end

  def create
    @current_measurement = CurrentMeasurement.new(measurement_params)
    if @current_measurement.save
      render json: { status: 'success' }
    else
      render json: { status: 'error' }
    end
  end

  private

  def measurement_params
    params.require(:current_measurement).permit(:temperature, :humidity, :pressure, :wind_speed, :wind_direction, :rainfall)
  end
end
