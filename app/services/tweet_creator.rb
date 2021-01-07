class TweetCreator
  def initialize(tweet_params)
    @params = tweet_params
    @owm_adpter_current = OpenWeatherMap::Current.new(@params).call
    @owm_adpter_forecast = OpenWeatherMap::Forecast.new(@params).call
  end

  def call
    Twitter::Update.new(full_text_message).call
  end

  private

  def full_text_message
    "#{current_message}#{forecast_message}"
  end

  def current_message
    "Hoje, #{@owm_adpter_current[:current_date]}, a temperatura é de #{@owm_adpter_current[:temp]}°C, e #{@owm_adpter_current[:weather]} em #{@owm_adpter_current[:city_name]}."
  end

  def forecast_message
    "Média para os próximos dias:  #{@owm_adpter_forecast.map { |k, _v| "#{k[:temps]}°C, em #{k[:date]}" }.join(', ')}"
  end
end