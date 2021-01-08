class OpenWeatherMap::Current
  def initialize(params)
    @api_key = ENV['OPEN_WEATHER_MAP']
    @params = params
    @api = AralyneOwm::Current.new(city_id, @api_key).call
  end

  def call
    return success_response if @api['cod'] == 200

    error_response
  end

  private

  def success_response
    {
      temp: @api['main']['temp'].ceil,
      city_name: @api['name'],
      weather: @api['weather'].first['description'], 
      current_date: Date.current.strftime("%d/%m/%Y")
    }
  end

  def error_response
    {code: @api['cod'], message: @api['message']}
  end

  def city_id
    @params[:city_id]
  end
end
