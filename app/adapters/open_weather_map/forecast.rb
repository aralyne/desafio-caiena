class OpenWeatherMap::Forecast
  def initialize(params)
    @params = params
    @api = OpenWeatherMap::Config.new(city, endpoint).call
  end

  def call
   
    @api['list'].map{|l| {date: l['dt'], temp: l['main']['temp']} }
    
    
  end

  private

  def endpoint
    'forecast'
  end

  def city
    @params[:city_name]
  end
end
