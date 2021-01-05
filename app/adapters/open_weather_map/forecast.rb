class OpenWeatherMap::Forecast
  def initialize(params)
    @params = params
    @api = OpenWeatherMap::Config.new(city_id, endpoint).call
  end

  def call
    list = []
    hash = @api['list'].map{|l| {date: l['dt'], temp: l['main']['temp']} }
    grouped = hash.group_by{|i| Time.at(i[:date]).to_date}
    grouped.each{|k,v| list << {date: k, temps: v.map{|i| i[:temp]}.sum(0.0) / v.size} }
    list
  end

  private

  def endpoint
    'forecast'
  end

  def city_id
    @params[:id]
  end
end
