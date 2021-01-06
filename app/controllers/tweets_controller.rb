class TweetsController < ApplicationController
  def create
    tweet = TweetCreator.new(tweet_params).call

    render json: tweet, status: :created
  end

  private
  
  def tweet_params
    params.require(:tweet).permit(:city_id)
  end
end