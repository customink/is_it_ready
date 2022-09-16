require 'test_helper'
require 'securerandom'

module IsItReady
  class NavigationWithTokenTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      ::IsItReady.bearer_token = ::SecureRandom.hex(15)
    end

    teardown do
      ::IsItReady.bearer_token = nil
    end

    test('it returns the correct response status on the root') do
      get root_url, headers: { 'HTTP_AUTHORIZATION' => "Bearer token=#{::IsItReady.bearer_token}" }

      assert_response :success
    end

    test('it returns the correct output on the root') do
      get root_url, headers: { 'HTTP_AUTHORIZATION' => "Bearer token=#{::IsItReady.bearer_token}" }

      response = ::JSON.parse(@response.body, symbolize_names: true)

      assert_equal({ :status => "ok", :code => 200 }, response)
    end

    test('it returns the correct response status on the root without token') do
      get root_url

      assert_response :unauthorized
    end
  end
end
