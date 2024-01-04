require "test_helper"

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get api_hello_url
    assert_response :success
  end
end
