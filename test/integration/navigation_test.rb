require 'test_helper'

module IsItReady
  class NavigationTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test('it returns the correct response status on the root') do
      get root_url

      assert_response :success
    end

    test('it returns the correct output on the root') do
      get root_url

      response = ::JSON.parse(@response.body, symbolize_names: true)

      assert_equal({ :status => "ok", :code => 200 }, response)
    end

    test('it returns the correct response status on the default path') do
      get DEFAULT_PATH

      assert_response :success
    end

    test('it returns the correct output on the default path') do
      get DEFAULT_PATH

      response = ::JSON.parse(@response.body, symbolize_names: true)

      assert_equal({ :status => "ok", :code => 200 }, response)
    end
  end
end
