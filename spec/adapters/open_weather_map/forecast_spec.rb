require 'rails_helper'

RSpec.describe OpenWeatherMap::Forecast do 
  describe '#call' do
    it 'must return forecast weather data object', :vcr do
      params = {id:'3395981'}

      adapter = OpenWeatherMap::Forecast.new(params).call

      expect(adapter[0]).to have_key(:date)
      expect(adapter[0]).to have_key(:temps)
      expect(adapter.size).to eq(6)
    end
  end
end