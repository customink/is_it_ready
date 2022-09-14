# frozen_string_literal: true

module IsItReady
  # This controller forms the base controller for all Engine controllers,
  # and is namespaced to our gem to avoid clashes with anything that's defined inside the application.
  #
  # All shared logic, as well as common code will be declared in this controller, allowing us to
  # keep things simple. Additional steps such as Authentication and Authorization will be defined here
  # as well, giving users the possibility to actually protect these endpoints from unwanted access of the
  # outside world and require valid Bearer tokens for incoming requests.
  # See the general configuration options to enable this protection in the controller.
  class ApplicationController < ActionController::Base
    protect_from_forgery :with => :exception

    # GET /is_it_ready
    #
    # Returns the desired output, running through the entire Ruby on Rails stack to indicate that
    # this application is able to serve requests. The routing is controlled through the Engine,
    # but we might be mounted under a specific endpoint or with a custom path.
    def is_it_ready
      render :json => { :status => 'ok', :code => 200 }
    end
  end
end
