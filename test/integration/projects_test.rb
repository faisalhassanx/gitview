require 'test_helper'

class ProjectsTest < ActionDispatch::IntegrationTest
  
  test 'should get projects index' do
    get projects_url
    assert_response :success
  end
  # test "the truth" do
  #   assert true
  # end
end
