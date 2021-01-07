class Twitter::Update
  def initialize(content)
    @content = content
    @client = Twitter::Config.new.call
  end

  def call
    @client.update(@content)
  end
end