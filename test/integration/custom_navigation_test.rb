require 'test_helper'

module IsItReady
  # This test verifies whether the Engine respects the dynamic configuration of the endpoint,
  # allowing it to be dynamically loaded when Rails loads the configuration, ensuring that we can
  # mount the engine using a custom path when required.
  class CustomNavigationTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      ::IsItReady.endpoint = '/something_else'
      ::Rails.application.reload_routes!
    end

    teardown do
      ::IsItReady.endpoint = ::IsItReady::DEFAULT_PATH
      ::Rails.application.reload_routes!
    end

    test('it returns the correct response status on the root') do
      get root_url

      assert_response :success
    end

    test('it returns the correct output on the root') do
      get root_url

      response = ::JSON.parse(@response.body, symbolize_names: true)

      assert_equal({ :status => "ok", :code => 200 }, response)
    end

    test('it returns the not found response status on the default path') do
      assert_raises(ActionController::RoutingError) { get DEFAULT_PATH }
    end
  end
end
