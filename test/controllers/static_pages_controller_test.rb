require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get not_found" do
    get static_pages_not_found_url
    assert_response :success
  end

  test "should get internal_server_error" do
    get static_pages_internal_server_error_url
    assert_response :success
  end
end
