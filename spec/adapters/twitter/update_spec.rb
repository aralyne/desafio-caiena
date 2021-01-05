require 'rails_helper'

RSpec.describe Twitter::Update do 
  describe '#call' do
    it 'must return Twitter data object', :vcr do
      open_weather_map_adpter = {
          city_name: 'Maceio',
          temp: 27,
          weather: 'Núvens Limpas',
          current_date: Date.current
      }

      adapter = Twitter::Update.new(open_weather_map_adpter).call

      expect(adapter).to include(:id)
    end
  end
end