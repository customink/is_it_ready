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

  # Specify the required version to ensure we keep up to date with releases and gem requirements
  s.required_ruby_version = '>= 2.2.0'

  # Ensure that people are actually using an up to date version of RubyGems
  unless s.respond_to?(:metadata)
    raise(::StandardError, 'RubyGems 2.0 or newer is required to protect against public gem pushes')
  end

  s.metadata['allowed_push_host'] = 'https://rubygems.pkg.github.com/customink'
  s.metadata['homepage_uri'] = s.homepage
  s.metadata['source_code_uri'] = 'https://github.com/customink/is_it_ready'
  s.metadata['changelog_uri'] = 'https://github.com/customink/is_it_ready/CHANGELOG.md'
  s.metadata['rubygems_mfa_required'] = 'true'

  s.files = Dir["{app,config,db,lib}/**/*"] + %w[MIT-LICENSE Rakefile README.md]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "minitest"
  s.add_development_dependency "bundler"
end
