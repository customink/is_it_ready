# frozen_string_literal: true

module IsItReady
  # This class forms the base of the Rails Engine, resembling the same as a core Rails application.
  # All dependencies and settings are controlled through this class, giving us the opportunity to define
  # how users will use this Engine in their applications.
  class Engine < ::Rails::Engine
    isolate_namespace IsItReady
  end
end
