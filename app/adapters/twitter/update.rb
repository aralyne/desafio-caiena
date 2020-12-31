class Twitter::Update
  def initialize
    @client = Twitter::Config.new.call
  end
  def call
    @client.update('Fazendo só um teste de integração com a API do Twitter')
  end
end
