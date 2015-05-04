lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json_http_connection/version'

Gem::Specification.new do |spec|
  spec.name          = 'json_http_connection'
  spec.version       = JsonHttpConnection::VERSION
  spec.authors       = ['Fernando Raganhan Barbosa']
  spec.email         = ['fernando.barbosa@vagas.com.br']
  spec.summary       = %q(Permanent HTTP connections to JSON services using faraday and typhoeus)
  spec.homepage      = 'https://github.com/VAGAScom/json_http_connection'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday',            '~> 0.9'
  spec.add_dependency 'faraday_middleware', '~> 0.9'
  spec.add_dependency 'typhoeus',           '~> 0.7'

  spec.add_development_dependency 'bundler',     '~> 1.7'
  spec.add_development_dependency 'rake',        '~> 10.0'
  spec.add_development_dependency 'rspec',       '~> 3.2'
  spec.add_development_dependency 'guard-rspec', '~> 4.5'
  spec.add_development_dependency 'webmock',     '~> 1.20'
  spec.add_development_dependency 'rubocop',     '~> 0.29'
end
