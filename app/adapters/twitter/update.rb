class Twitter::Update
  def initialize
    @params_api = OpenWeatherMap::Current.new({city_id:'3395981', endpoint:'weather'}).call
    @client = Twitter::Config.new.call
  end
  def call
    list = @params_api,
    current_date =  @params_api[:current_date] ,
    city_name = @params_api[:city_name],
    temp = @params_api[:temp],
    weather =  @params_api[:weather],
    @client.update("Hoje, #{current_date}, a temperatura é de #{temp}°C com tempo #{weather} em #{city_name}.")
  end
end

