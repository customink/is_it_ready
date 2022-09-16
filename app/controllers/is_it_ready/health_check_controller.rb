# frozen_string_literal: true

module IsItReady
  class HealthCheckController < ::IsItReady::ApplicationController
    # Disable the CSRF security checks, since this controller will receive calls from external
    # services that do not have the ability to generate the required CSRF token
    skip_before_action :verify_authenticity_token

    # Ensure that all incoming requests supply a valid Bearer token in their Authorization header.
    # The function will determine whether the check is required or not based upon the configuration.
    before_action :authenticate!

    AUTHORIZATION_HEADER = 'HTTP_AUTHORIZATION'

    # GET /is_it_ready
    #
    # Returns the desired output, running through the entire Ruby on Rails stack to indicate that
    # this application is able to serve requests. The routing is controlled through the Engine,
    # but we might be mounted under a specific endpoint or with a custom path.
    def is_it_ready
      render :json => { :status => 'ok', :code => 200 }
    end

    private

    # This action will look up the HTTP Authorization header when the configuration has a Bearer token set.
    # When the token is set, the incoming requests must provide this as a Bearer token, otherwise the request
    # will be refused with an HTTP UNAUTHORIZED response.
    def authenticate!
      return unless ::IsItReady.bearer_token.present?

      authenticate_or_request_with_http_token do |token, _options|
        ::IsItReady.bearer_token == token
      end
    end
  end
end
