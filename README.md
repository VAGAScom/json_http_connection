# JsonHttpConnection

Cria conexões com serviços HTTP da Vagas que trasmitam JSON

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'json_http_connection'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install json_http_connection

## Usage

Para criar uma nova conexão use `JsonHttpConnection::Connection.new(url: 'http://minha.api.vagas.com.br')`. Essa conexão expõe todos os métodos de uma `connection` do faraday, https://github.com/lostisland/faraday, configurada para tratar JSON

