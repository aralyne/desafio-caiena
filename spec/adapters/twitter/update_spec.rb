require 'rails_helper'

RSpec.describe Twitter::Update do 
  describe '#call' do
    it 'must return Twitter data object', :vcr do
      
      owm_adpter_current = {
          city_name: 'Maceio',
          temp: 27,
          weather: 'Núvens Limpas',
          current_date: Date.current
      }
      owm_adpter_forecast = [
        {date: '06/01/2021', temps: 27},
        {date: '07/01/2021', temps: 26},
        {date: '05/01/2021', temps: 26},
        {date: '09/01/2021', temps: 27},
        {date: '10/01/2021', temps: 27},
        {date: '11/01/2021', temps: 25}
      ]

      adapter = Twitter::Update.new(owm_adpter_current, owm_adpter_forecast).call
      expect(adapter).to include(:id)
    end
  end
end