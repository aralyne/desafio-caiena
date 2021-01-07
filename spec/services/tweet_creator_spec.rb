require 'rails_helper'

RSpec.describe TweetCreator do 
  describe '#call' do
    it 'create tweet', :vcr do

      tweet_params = {city_id: 3395981}

      tweet = TweetCreator.new(tweet_params).call

      expect(tweet).to include(:id)
      expect(tweet).to include(:created_at)
      expect(tweet).to include(:text)
    end
  end
end