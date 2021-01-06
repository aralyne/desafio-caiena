class OpenWeatherMap::Forecast
  def initialize(params)
    @params = params
    @api = OpenWeatherMap::Config.new(city_id, endpoint).call
  end

  def call
    #success_response
    return success_response if @api['cod'] == '200'

    error_response
  end

  private

  def success_response
    list = []
    hash = @api['list'].map{|l| {date: l['dt'], temp: l['main']['temp']} }
    grouped = hash.group_by{|i| Time.at(i[:date]).to_date}
    grouped.each{|k,v| list << {date: k, temps: v.map{|i| i[:temp].ceil}.sum / v.size} }
    list
  end

  def error_response
    {code: @api['cod'], message: @api['message']}
  end

  def endpoint
    'forecast'
  end

  def city_id
    @params[:city_id]
  end
end
