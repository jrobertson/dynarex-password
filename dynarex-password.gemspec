Gem::Specification.new do |s|
  s.name = 'dynarex-password'
  s.version = '0.1.12'
  s.summary = 'dynarex-password'
  s.authors = ['James Robertson']
  s.files = Dir['lib/dynarex-password.rb']
  s.add_runtime_dependency('dynarex', '~> 1.8', '>=1.8.1') 
  s.signing_key = '../privatekeys/dynarex-password.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/dynarex-password'
  s.required_ruby_version = '>= 2.1.2'
end
