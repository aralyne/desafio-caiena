require 'rails_helper'

RSpec.describe Twitter::Update do 
  describe '#call' do
    it 'must return Twitter data object', :vcr do
      #params = { city_id: '3395981' }

      Twitter::Update.new.call
      
    end
  end
end