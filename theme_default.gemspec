$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "theme_default/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "theme_default"
  s.version     = ThemeDefault::VERSION
  s.authors     = ["Bruno Porto"]
  s.email       = ["brunotporto@gmail.com"]
  s.homepage    = "http://www.brunoporto.com.br/"
  s.summary     = "GEM para inicialização de tema para Rails"
  s.description = "GEM para inicialização de tema para Rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency 'simple-navigation'
  s.add_dependency 'unobtrusive_flash'

  # s.add_development_dependency "sqlite3"
end
