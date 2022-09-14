# Is It Ready?

A Ruby gem that adds a simple Rails engine to your application to see if it's ready to serve requests.
The endpoint and mounting options are configurable using the standard Rails conventions.

This Engine is used by Custom Ink to verify whether their infrastructure is able to serve HTTP requests,
and allows Kubernetes to add/remove applications from the load-balancer based upon the results returned.

## Requirements
* Ruby `>= 2.2.0`
* Ruby on Rails `>= 3.2.22.5`

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
