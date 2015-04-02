require 'test_helper'

class FootballControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get matches" do
    get :matches
    assert_response :success
  end

  test "should get players" do
    get :players
    assert_response :success
  end

end
