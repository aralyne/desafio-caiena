class OpenWeatherMap::Current
  def initialize(params)
    @params = params
    @api = OpenWeatherMap::Config.new(city, endpoint).call
  end

  def call
    if @api['cod'] == 200
      {
        temp: @api['main']['temp'],
        city_name: @api['name'],
        weather: @api['weather'].first['description'], 
        current_date: Date.current.strftime("%d/%m/%Y")
      }
    else
      @api
    end
  end

  private

  def endpoint
    'weather'
  end

  def city
    @params[:id]
  end
end
