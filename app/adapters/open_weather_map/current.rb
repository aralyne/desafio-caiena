class OpenWeatherMap::Current
  def initialize(params)
    @params = params
    @api = OpenWeatherMap::Config.new(city_id, endpoint).call
  end

  def call
    return success_response if @api['cod'] == 200

    error_response
  end

  private

  def success_response
    {
      temp: @api['main']['temp'],
      city_name: @api['name'],
      weather: @api['weather'].first['description'], 
      current_date: Date.current.strftime("%d/%m/%Y")
    }
  end

  def error_response
    {code: @api['cod'], message: @api['message']}
  end

  def endpoint
    'weather'
  end

  def city_id
    @params[:id]
  end
end
