# frozen_string_literal: true

module IsItReady
  # This class is a Rack::Middleware implementation that will support us in silencing the
  # logging of calls for incoming requests against the endpoint. Otherwise the app would be
  # writing all requests in the Rails logs, causing an overload of information to be reported
  # that's simply not relevant. The usage of this Middleware can be controlled through the Engine's
  # configuration on whether to silence logging or not.
  class LogSilencer
    # Creates a new instance of the Middleware and initializes it using the Rack standard approach
    # for setting up the required values in a Rack::Middleware.
    def initialize(app, opts = {})
      @silenced = opts.delete(:silenced)
      @app = app
    end

    # Executes the Middleware.
    # If the environment contains the special X-SILENCE-LOGGER header to globally silence the request,
    # or the path matches the provided silence configuration, the middleware will silence Rails for the
    # request, otherwise pass the request along.
    def call(env)
      if ::IsItReady.silence_logs && silence_path?(env['PATH_INFO'])
        ::Rails.logger.silence do
          @app.call(env)
        end
      else
        @app.call(env)
      end
    end

    private

    # Returns true when the given path needs to be silenced.
    # This uses a manual Regex check, since the .match? method might not exist depending on the Ruby
    # version that's being used for this gem. So we perform a manual match and return true if there's
    # a 0 response.
    def silence_path?(path)
      (path =~ /#{@silenced}/).present?
    end
  end
end
