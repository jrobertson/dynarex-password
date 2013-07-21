Gem::Specification.new do |s|
  s.name = 'dynarex-password'
  s.version = '0.1.6'
  s.summary = 'dynarex-password'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.add_dependency('dynarex') 
  s.signing_key = '../privatekeys/dynarex-password.pem'
  s.cert_chain  = ['gem-public_cert.pem']
end
