# frozen_string_literal: true

require 'test_helper'

module IsItReady
  # This class tests whether the ::Rails.logger is properly silenced during the execution of the Rails.engine.
  # By default silencing of the incoming requests on the health check is disabled to avoid the Rails logs
  # from being spammed with the repeated health checks.
  class SilentLoggingTest < ::ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include ::LoggerIntrospection

    test('it does not write anything to the standard Rails logger') do
      with_logger_introspection do |logger_output|
        get root_url

        refute_match(/Started GET "#{::IsItReady.endpoint}" for 127.0.0.1 at */, logger_output.string)
      end
    end
  end
end
