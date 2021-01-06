class TweetsController < ApplicationController
  def create
    owm_adpter_current = OpenWeatherMap::Current.new(weather_params).call
    owm_adpter_forecast = OpenWeatherMap::Forecast.new(weather_params).call
    tweet = Twitter::Update.new(owm_adpter_current, owm_adpter_forecast).call

    render json: tweet, status: :created
  end

  private
  
  def weather_params
    params.require(:tweet).permit(:city_id)
  end
end