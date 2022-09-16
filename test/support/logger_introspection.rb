# frozen_string_literal: true

# This module contains methods that can be used in tests to perform introspection on the Rails logger.
# This allows us to wrap some support functionality inside our tests and check whether certain behavior
# is implemented correctly without overloading the test itself.
module LoggerIntrospection
  # Performs introspection on the ::Rails.logger with the given block inside the test.
  # The method will duplicate the original logger, and replace the logger with a simple StringIO object.
  # All log entries are then made available in the object, and after the test the logger is restored
  # to the original functionality to not affect other tests.
  def with_logger_introspection(&block)
    original_logger = ::Rails.logger.dup
    @logger_output = ::StringIO.new

    begin
      ::Rails.logger = ::ActiveSupport::Logger.new(@logger_output)
      block.call(@logger_output)
    ensure
      ::Rails.logger = original_logger
    end
  end
end
