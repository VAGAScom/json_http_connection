# JsonHttpConnection

Make HTTP connections to JSON services using faraday and typhoeus.  

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

To create a new connection: `JsonHttpConnection::Connection.new(url: 'http://my.service.url/')`. This is a decorated faraday connection with middlewares configured to deal with JSON
