class Twitter::Config
  def initialize
      @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "O2XqAd2sZ4rX795BNJQIW8N2k"
      config.consumer_secret     = "ekLMPHndJ5gF4evmIDe8zJThOt4VYlZDr9JEZwx6UgzFa4FLNn"
      config.access_token        = "274830132-i6nvdvFvsR583rJjROAOFRlZYae5zLKafhpp93UR"
      config.access_token_secret = "ApXeptlfnW8hHKbxxtkjlwuoIs3bYcy64oQRKSGKmGWjE"
      end
  end

  def call
    @client
  end
end




