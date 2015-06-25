Gem::Specification.new do |s|
  s.name        = 'ruby-ridb'
  s.version     = '0.1.0'
  s.date        = '2015-06-22'
  s.summary     = "USDA RIDB Ruby API wrapper"
  s.description = "A Ruby wrapper for the USDA's RIDB API. The RIDB API returns information for federal recreation areas, facilities, campsites, tours, and permits"
  s.authors     = ["Annie Lydens"]
  s.email       = ['aelydens@gmail.com']
  s.files       = `git ls-files -z`.split("\x0")
  s.homepage    = ''
  s.license     = 'MIT'

  s.add_runtime_dependency 'httparty'
  s.add_runtime_dependency 'json'
  s.add_development_dependency "vcr", "~> 1.7"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec"
  s.add_development_dependency "webmock"
end
