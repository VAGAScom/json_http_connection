lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagas_service_connection/version'

Gem::Specification.new do |spec|
  spec.name          = 'vagas_service_connection'
  spec.version       = VagasServiceConnection::VERSION
  spec.authors       = ['Fernando Raganhan Barbosa']
  spec.email         = ['fernando.barbosa@vagas.com.br']
  spec.summary       = %q(Cria conexões com serviços HTTP da Vagas que trasmitam JSON)
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'typhoeus'
  spec.add_dependency 'multi_json'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'rubocop'
end
