# Is It Ready?

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/customink/is_it_ready/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/customink/is_it_ready/tree/main)

A Ruby gem that adds a simple Rails engine to your application to see if it's ready to serve requests.
The endpoint and mounting options are configurable using the standard Rails conventions.

This Engine is used by Custom Ink to verify whether their infrastructure is able to serve HTTP requests,
and allows Kubernetes to add/remove applications from the load-balancer based upon the results returned.

## Requirements
* Ruby `>= 2.2.0`
* Ruby on Rails `>= 3.2.22.5`

### Compatibility Matrix
This Matrix provides an overview on which versions of Ruby are tested against which Ruby on Rails versions.
These combinations are guaranteed to work, whereas other combinations might work but are not guaranteed.

| Ruby Version | Rails `~> 3.2` | Rails `~> 4.0` | Rails `~> 4.1` | Rails `~> 4.2` | Rails `~> 5.0` | Rails `~> 5.1` | Rails `~> 5.2` | Rails `~> 6.0` | Rails `~> 6.1` | Rails 7.0.0 | Rails `~> 7.0` |
|--------------|----------------|----------------|----------------|----------------|----------------|----------------|----------------|----------------|----------------|-------------|----------------|
| `2.2`        | ☑️             | ☑️             | ☑️             | ☑️             | ☑️             | ☑️             | ☑️             | -              | -              | -           | -              |
| `2.3`        | -              | -              | -              | -              | ☑️             | ☑️             | ☑️             | -              | -              | -           | -              | - |
| `2.4`        | -              | -              | -              | -              | ☑️             | ☑️             | ☑️             | -              | -              | -           | -              | - |
| `2.5`        | -              | -              | -              | -              | -              | ☑️             | ☑️             | ☑️             | ☑️             | -           | -              | - |
| `2.6`        | -              | -              | -              | -              | -              | -              | ☑️             | ☑️             | ☑️             | -           | -              | - |
| `2.7`        | -              | -              | -              | -              | -              | -              | -              | ☑️             | ☑️             | ☑️          | -              |
| `3.0`        | -              | -              | -              | -              | -              | -              | -              | -              | -              | ☑️          | -              |
| `3.1`        | -              | -              | -              | -              | -              | -              | -              | -              | -              | -           | ☑️             |

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'is_it_ready', github: 'customink/is_it_ready'
```

And then execute:

```bash
% bundle install
```

## Usage

Simply mount the engine in your `config/routes.rb` and the routes will be available under the given path.

```ruby
Rails.application.routes.draw do
  mount IsItReady::Engine => "/is_it_ready"
end
```

With the above snippet, the health check will be available under:

* https://your-domain/is_it_ready

## Configuration

Sometimes additional configuration might be required. For example when the endpoint is reserved in your application
or conflicts with another plugin. In this case, creating an initializer under `config/initializers/is_it_ready.rb` can help.

```ruby
# Initializer example to overwrite specific settings for the gem, or to enable certain features.
# 

# Overwrite the endpoint that's used for listening to the required calls from the ReadinessProbe.
# Setting this value, changes the second entry to be the path defined here, as well as the path under which
# the application has been mounted:
#   * https://your-domain/something_else
# This is more for cosmetic purposes, or when mountain multiple engines under the same endpoint with distinct routes.
::IsItReady.endpoint = '/something_else'
```

## Contributing

1. Fork it (https://github.com/customink/is_it_ready/fork).
2. Run `bin/setup` to ensure your environment is configured for development.
3. Run `bin/test` to ensure all tests pass
4. Create your feature branch: `git checkout -b my-new-feature`
5. Commit your changes: `git commit -am 'Adding a new feature`
6. Push to the branch: `git push origin my-new-feature`
7. Create a new pull request to our repository

## References

* [Rails Engine Guide](https://guides.rubyonrails.org/engines.html)
