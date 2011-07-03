require 'test_helper'

class GetlinkControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get get_link" do
    get :get_link
    assert_response :success
  end

end
