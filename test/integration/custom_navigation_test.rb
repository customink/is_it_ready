require 'test_helper'

module IsItReady
  class CustomNavigationTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      ::IsItReady.endpoint = '/something_else'
      Rails.application.reload_routes!
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
