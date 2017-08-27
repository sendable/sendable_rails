$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sendable_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sendable_rails"
  s.version     = SendableRails::VERSION
  s.authors     = ["Umair Siddique"]
  s.email       = ["umairsiddique@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SendableRails."
  s.description = "TODO: Description of SendableRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.3"

  s.add_development_dependency "sqlite3"
end
