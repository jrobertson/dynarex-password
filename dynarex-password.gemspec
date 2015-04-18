Gem::Specification.new do |s|
  s.name = 'dynarex-password'
  s.version = '0.1.11'
  s.summary = 'dynarex-password'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.add_runtime_dependency('dynarex', '~> 1.2', '>=1.2.90') 
  s.signing_key = '../privatekeys/dynarex-password.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/dynarex-password'
  s.required_ruby_version = '>= 2.1.2'
end
