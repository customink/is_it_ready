# frozen_string_literal: true

# This file controls all the routing that's supported by the IsItReady engine.
# This follows the same pattern as standard Ruby on Rails routing, but is scoped to
# just the Rails Engine.
::IsItReady::Engine.routes.draw do
  get ::IsItReady.endpoint => 'application#is_it_ready'
  root :to => 'application#is_it_ready'
end
