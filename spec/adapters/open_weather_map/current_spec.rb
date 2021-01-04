require 'rails_helper'

RSpec.describe OpenWeatherMap::Current do 
  describe '#call' do
    it 'must return current weather data object', :vcr do
      params = {id:'3395981'} #Maceió -3395981

      adapter = OpenWeatherMap::Current.new(params).call

      expect(adapter).to have_key(:city_name)
      expect(adapter).to have_key(:temp)
      expect(adapter).to have_key(:weather)
      expect(adapter).to have_key(:current_date)
    end
  end
end