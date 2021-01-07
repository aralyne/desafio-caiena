require 'rails_helper'

RSpec.describe Twitter::Update do 
  describe '#call' do
    it 'must return Twitter data object', :vcr do
      content = 'Hello world!'

      adapter = Twitter::Update.new(content).call

      expect(adapter).to include(:id)
    end
  end
end