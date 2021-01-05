require 'rails_helper'

RSpec.describe OpenWeatherMap::Current do 
  describe '#call' do
    context 'When return current weather data objec' do
      it 'must return current weather data object', :vcr do
        params = {id:'3395981'} #Maceió -3395981

        adapter = OpenWeatherMap::Current.new(params).call

        expect(adapter).to have_key(:city_name)
        expect(adapter).to have_key(:temp)
        expect(adapter).to have_key(:weather)
        expect(adapter).to have_key(:current_date)
      end
    end

    context 'When not return current weather data object' do
      it 'must return 400 http status code', :vcr do
        params = {id:nil} 

        adapter = OpenWeatherMap::Current.new(params).call

        expect(adapter).to have_key('message')
        expect(adapter['message']).to eq('Nothing to geocode')
        expect(adapter).to have_key('cod')
        expect(adapter['cod']).to eq('400')
        
        
      end
    end
  end
end