# Is It Ready? CHANGELOG

## 0.1.0
* Drop support for Ruby 2.2, 2.3, 2.4 and 2.6 and for Rails older than 5.1 (minimum is now Ruby 2.5)
* Test against the Ruby versions built by docker-base-images (2.5, 2.7, 3.0, 3.1, 3.2, 3.3, 3.4 and 4.0) on the jammy, noble and resolute images
* Add Rails 7.1, 8.0 and 8.1 to the test matrix

## 0.0.5
* Silence Rails and the Rack middleware by default
* Add an option to allow logging of requests

## 0.0.4
* Add support for HTTP Authorization Bearer tokens

## 0.0.3
* Make the mounting of the engine dynamic based upon the configuration

## 0.0.2
* Enabled the CircleCI Pipeline
* Added the test matrix
* Updated documentation

## 0.0.1
* Initial implementation
