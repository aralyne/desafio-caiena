require 'rails_helper'

RSpec.describe OpenWeatherMap::Forecast do 
  describe '#call' do
    context 'When return forecast weather data objec' do
      it 'must return forecast weather data object', :vcr do
        params = {city_id: '3395981'}

        adapter = OpenWeatherMap::Forecast.new(params).call

        expect(adapter[0]).to have_key(:date)
        expect(adapter[0]).to have_key(:temps)
        expect(adapter.size).to eq(6)
      end
    end
  end

  context 'When not return forecast weather data object' do
    it 'must return 400 http status code', :vcr do
      params = {city_id: nil}

      adapter = OpenWeatherMap::Forecast.new(params).call

      expect(adapter).to have_key(:message)
      expect(adapter[:message]).to eq('Nothing to geocode')
      expect(adapter).to have_key(:code)
      expect(adapter[:code]).to eq('400')
    end
  end
end