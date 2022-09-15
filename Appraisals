# This is the Appraisals file that determines which specific gems should be tested based upon the selected
# Ruby version and Ruby on Rails framework.
# Because each of these configurations have their own requirements, we will build a compatibility matrix and
# make sure that each step includes the correct version of Ruby on Rails, and freezes the dependencies to the
# requirements of that version.

# Ruby 2.2 will be used to test all EOL Ruby on Rails versions still in use by Custom Ink.
# This is simply to provide a guarantee our code works against them until we can drop these versions.
if ::Gem::Version.new(RUBY_VERSION) < ::Gem::Version.new('2.3.0')
    appraise 'rails32' do
        gem 'rails', '~> 3.2.0'
        gem 'rake', '< 13'
    end

    appraise 'rails40' do
        gem 'rails', '~> 4.0.0'
        gem 'rake', '< 13'
    end

    appraise 'rails41' do
        gem 'rails', '~> 4.1.0'
        gem 'rake', '< 13'
    end

    appraise 'rails42' do
        gem 'rails', '~> 4.2.0'
        gem 'rake', '< 13'
    end
end

if ::Gem::Version.new(RUBY_VERSION) < ::Gem::Version.new('2.5.0')
    appraise 'rails50' do
        gem 'rails', '~> 5.0.0'
        gem 'rake', '< 13'
    end
end

if ::Gem::Version.new(RUBY_VERSION) < ::Gem::Version.new('2.6.0')
    appraise 'rails51' do
        gem 'rails', '~> 5.1.0'
        gem 'rake', '< 13'
    end
end

if ::Gem::Version.new(RUBY_VERSION) < ::Gem::Version.new('2.7.0')
    appraise 'rails52' do
        gem 'rails', '~> 5.2.0'
        gem 'rake', '< 13'
    end
end

# For Ruby versions >= 2.5.0 and < 3.0 we can test all Rails 6
if ::Gem::Version.new(RUBY_VERSION) >= ::Gem::Version.new('2.5.0') && ::Gem::Version.new(RUBY_VERSION) < ::Gem::Version.new('3.0.0')
    appraise 'rails60' do
        gem 'rails', '~> 6.0.0'
    end

    appraise 'rails61' do
        gem 'rails', '~> 6.1.0'
    end
end

# Ruby on Rails 7.0.0 recommends Ruby to be >= 2.7.0
if ::Gem::Version.new(RUBY_VERSION) >= ::Gem::Version.new('2.7.0')
    appraise 'rails70' do
        gem 'rails', '7.0.0'
    end
end

# Ruby on Rails 7.0.x recommend Ruby to be >= 3.1.0
if ::Gem::Version.new(RUBY_VERSION) >= ::Gem::Version.new('3.1.0')
    appraise 'rails7' do
        gem 'rails', '~> 7.0.0'
    end
end
