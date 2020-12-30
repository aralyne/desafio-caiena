class OpenWeatherMap::Config
  def initialize(city_name, endpoint)
    @api_key = 'e88c1515be1de476a1469d4bdb9cb1eb'
    @city_name = city_name
    @endpoint = endpoint
    @api_response = HTTParty.get("http://api.openweathermap.org/data/2.5/#{@endpoint}?q=#{@city_name}&appid=#{@api_key}")
  end

  def call
    @api_response
  end
end

