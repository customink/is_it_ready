# frozen_string_literal: true

require 'test_helper'

module IsItReady
  # This class tests whether the ::Rails.logger is properly enabled during the execution of the Rails.engine.
  # By default silencing of the incoming requests on the health check is disabled to avoid the Rails logs
  # from being spammed with the repeated health checks. With this test, we check whether the Engine
  # respects the configuration at runtime.
  class SilentLoggingTest < ::ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include ::LoggerIntrospection

    setup do
      ::IsItReady.endpoint = ::IsItReady::DEFAULT_PATH
      ::IsItReady.silence_logs = false
    end

    teardown do
      ::IsItReady.silence_logs = true
    end

    test('it writes the request to the standard Rails logger') do
      with_logger_introspection do |logger_output|
        get root_url

        assert_match(/Started GET "#{::IsItReady.endpoint}\/" for 127.0.0.1 at */, logger_output.string)
      end
    end
  end
end
