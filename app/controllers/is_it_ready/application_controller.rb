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
  end
end
