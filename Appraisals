# This is the Appraisals file that determines which specific gems should be tested based upon the selected
# Ruby version and Ruby on Rails framework.
# Because each of these configurations have their own requirements, we will build a compatibility matrix and
# make sure that each step includes the correct version of Ruby on Rails, and freezes the dependencies to the
# requirements of that version.

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
        gem 'concurrent-ruby', '< 1.3.5'
    end
end

# Ruby on Rails 7.0.x recommend Ruby to be >= 3.1.0
if ::Gem::Version.new(RUBY_VERSION) >= ::Gem::Version.new('3.1.0')
    appraise 'rails7' do
        gem 'rails', '~> 7.0.0'
    end
end

if ::Gem::Version.new(RUBY_VERSION) >= ::Gem::Version.new('3.3.0')
    appraise 'rails71' do
        gem 'rails', '~> 7.1.0'
    end
end

if ::Gem::Version.new(RUBY_VERSION) >= ::Gem::Version.new('3.4.0')
    appraise 'rails80' do
        gem 'rails', '~> 8.0.0'
    end

    appraise 'rails81' do
        gem 'rails', '~> 8.1.0'
    end
end
