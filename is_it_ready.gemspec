$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "is_it_ready/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "is_it_ready"
  s.version     = IsItReady::VERSION
  s.authors     = ["Arne De Herdt"]
  s.email       = ["arne.deherdt@customink.com"]
  s.homepage    = "https://github.com/customink/is_it_ready"
  s.summary     = "Rails Engine to verify whether application can serve traffic"
  s.description = "An internal tool used by Custom Ink to take application from the Kubernetes load-balancer"

  s.files = Dir["{app,config,db,lib}/**/*"] + %w[MIT-LICENSE Rakefile README.md]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.22.5"

  s.add_development_dependency "sqlite3", '~> 1.3.5'
  s.add_development_dependency "minitest"
end
