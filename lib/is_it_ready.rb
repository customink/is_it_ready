# frozen_string_literal: true

require 'is_it_ready/log_silencer'
require "is_it_ready/engine"

# The namespace holding everything related to our Gem.
# Shared logic and configuration options will be defined here, allowing us to keep the rest of the
# code and modules clean.
module IsItReady
  DEFAULT_PATH = '/is_it_ready'

  # Sets the endpoint under which the actual check is being triggered.
  # By default we will map the /is_it_ready path as the check for any application,
  # but if this is already claimed by an application, it can be overwritten.
  mattr_accessor :endpoint
  @@endpoint = DEFAULT_PATH

  # Sets the Bearer token to be used when securing the endpoint.
  # By default this is left blank, and disables the security verification of the controller.
  # When enabled however, the request will need to provide the required token as a Bearer value
  # in the AUTHORIZATION header of the request.
  mattr_accessor :bearer_token

  # Silences the logging of the request against the endpoint. Defaults to true.
  # When disabled, the entire request will appear in the Rails logs.
  mattr_accessor :silence_logs
  @@silence_logs = true
end
