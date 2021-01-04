require 'rails_helper'

RSpec.describe 'TweetController' do 
  describe 'POST #create' do
    it 'must return 201 status code', :vcr do
      params = {id:'3395981'}

      post '/tweets', params: {city: params}

      expect(response).to have_http_status(:created)
    end
  end
end