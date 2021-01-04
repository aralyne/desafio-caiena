require 'rails_helper'

RSpec.describe OpenWeatherMap::Forecast do 
  describe '#call' do
    it 'must return forecast weather data object', :vcr do
      params = { city_name: 'Maceio' }

      adapter = OpenWeatherMap::Forecast.new(params).call
      
      expect(adapter).to have_key(:temp)
      expect(adapter).to have_key(:date)
    end
  end
end