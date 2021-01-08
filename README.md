# Desafio Caiena

Realizar tweets com a previsão do tempo do dia atual e dos próximos 5 dias.

# Configuração Inicial

  - Clonar este repositório 
```sh
$ git clone https://github.com/aralyne/desafio-caiena.git
```
  - Acessar o projeto e excutar: 
```sh
$ bundle install
```
- Acessar o arquivo .env.example e renomeá-lo para .env e atribuir uma Key de acesso ao parâmetro OPEN_WEATHER_MAP. Caso não tenha uma chave, a seguinte chave pode ser usada para teste. 
```sh
OPEN_WEATHER_MAP=e88c1515be1de476a1469d4bdb9cb1eb
```
Como obter uma chave de API: (http://openweathermap.org/appid)
- Ainda no arquivo .env devem ser configuradas as keys de acesso do Twitter e preencher os parâmetros:
```sh
CONSUMER_KEY=
CONSUMER_SECRET=
ACCESS_TOKEN=
ACCESS_TOKEN_SECRET=
```
Para obter chaves do Twitter é necessário habilitar a conta de desenvolvedor acesse: https://developer.twitter.com/en e saiba mais. 

Com isso a aplicação já estará pronta para uso.

# Testes 
Para testar a aplicação pode ser usado: 
```sh
$ rspec spec/
```
# Tweetar
Para iniciar o serviço da aplicação: 
```sh
$ rails s
```
Informar o ID da cidade para Tweetar as condições climáticas 

```sh
{"tweet": { "city_id": id_da_cidade} }
```
Por exemplo: {"tweet": { "city_id": 3395981} } para a cidade de Maceió. Para saber mais sobre IDs de cidades acesse: https://openweathermap.org/forecast5#cityid5

License
----

MIT
