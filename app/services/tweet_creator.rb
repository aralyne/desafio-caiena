class TweetCreator
  def initialize(tweet_params)
    @params = tweet_params
    @owm_adpter_current = OpenWeatherMap::Current.new(@params).call
    @owm_adpter_forecast = OpenWeatherMap::Forecast.new(@params).call
  end

  def call
    Twitter::Update.new(@owm_adpter_current, @owm_adpter_forecast).call
  end
end