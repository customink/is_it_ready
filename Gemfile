source 'https://rubygems.org'

# Declare your gem's dependencies in is_it_ready.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# On Ruby 2.2, the gem test-unit is not included anymore by default
# For Rails 3.2, this is a required dependency, so ensure this is installed automatically for all
# versions of Ruby that support Rails 3.2
if ::Gem::Version.new(RUBY_VERSION) < ::Gem::Version.new('2.5.0')
  gem 'test-unit', '~> 3.0'
end

# These are testing dependencies for the CircleCI environment and our general test reporting.
# They don't need to be inside the gemspec as they are specific to the CI, not the project.
group :test do
  gem 'appraisal'
  gem 'minitest-ci', require: false
  gem 'simplecov', require: false

  # jquery-rails is used by the dummy application
  gem 'jquery-rails'
end
