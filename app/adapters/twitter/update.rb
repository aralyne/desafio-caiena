class Twitter::Update
  def initialize(weather_response_current, weather_response_forecast)
    @weather_response_current = weather_response_current
    @weather_response_forecast = weather_response_forecast
    @client = Twitter::Config.new.call
  end
  
  def call
     @client.update(
      "#{current_message} #{forecast_message}"
      )
  end

  private

  def current_message
    "Hoje, #{@weather_response_current[:current_date]}, a temperatura é de #{@weather_response_current[:temp]}°C com tempo #{@weather_response_current[:weather]} em #{@weather_response_current[:city_name]}."
  end

  def forecast_message
    "A previsão para os próximos 5 dias é: #{@weather_response_forecast.each{|w| w[:date]}}"
  end
end

