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
        {date: 'Tue, 05 Jan 2021', temps: 27.25},
        {date: 'Wed, 06 Jan 2021', temps: 26.49},
        {date: 'Thu, 07 Jan 2021', temps: 26.67},
        {date: 'Fri, 08 Jan 2021', temps: 27.05},
        {date: 'Sat, 09 Jan 2021', temps: 27.10},
        {date: 'Sun, 10 Jan 2021', temps: 25.98}
      ]

      adapter = Twitter::Update.new(owm_adpter_current, owm_adpter_forecast).call

      expect(adapter).to include(:id)
    end
  end
end