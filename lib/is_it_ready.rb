# frozen_string_literal: true

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
end
