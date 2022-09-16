# frozen_string_literal: true

module IsItReady
  # This class forms the base of the Rails Engine, resembling the same as a core Rails application.
  # All dependencies and settings are controlled through this class, giving us the opportunity to define
  # how users will use this Engine in their applications.
  class Engine < ::Rails::Engine
    isolate_namespace IsItReady

    # Initialize the engine dynamically based upon the configuration.
    # This allows us to specify the configuration for the engine in the host application instead.
    initializer 'add_routing_paths' do |app|
      app.routes.append do
        mount ::IsItReady::Engine => ::IsItReady.endpoint
      end
    end

    # If the user has enabled the silencing of the loggers, we will mount the middleware
    # to do so, otherwise skip the process entirely.
    initializer 'is_it_ready.add_middleware' do |app|
      app.middleware.insert_before(::Rails::Rack::Logger, ::IsItReady::LogSilencer, silenced: ::IsItReady.endpoint)
    end
  end
end
