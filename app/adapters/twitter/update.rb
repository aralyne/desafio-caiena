class Twitter::Update
  def initialize(weather_response)
    @weather_response = weather_response
    @client = Twitter::Config.new.call
  end
  
  def call
    @client.update(
      "Hoje, #{@weather_response[:current_date]}, a temperatura é de #{@weather_response[:temp]}°C com tempo #{@weather_response[:weather]} em #{@weather_response[:city_name]}."
      )
  end
end

