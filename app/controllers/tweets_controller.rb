class TweetsController < ApplicationController
  def create
    open_weather_map_adpter = OpenWeatherMap::Current.new(weather_params).call
    tweet = Twitter::Update.new(open_weather_map_adpter).call

    render json: tweet, status: :created
  end

  private
  def weather_params
    params.require(:city).permit(:id)
  end
end