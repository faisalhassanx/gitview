require 'test_helper'

class DevelopersSignupTest < ActionDispatch::IntegrationTest
  
  test "should get register path" do
    get register_path
    assert_response :success
  end
  
end
