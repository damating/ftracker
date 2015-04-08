require 'test_helper'

class FootballControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end


end
