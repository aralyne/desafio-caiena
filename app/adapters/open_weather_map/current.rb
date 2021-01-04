class OpenWeatherMap::Current
  def initialize(params)
    @params = params
    @api = OpenWeatherMap::Config.new(city, endpoint).call
  end

  def call
    {
      temp: @api['main']['temp'],
      city_name: @api['name'],
      weather: @api['weather'].first['description'], 
      current_date: Date.current.strftime("%d/%m/%Y")
    }
  end

  private

  def endpoint
    'weather'
  end

  def city
    @params[:id]
  end
end
