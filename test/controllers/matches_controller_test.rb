require 'test_helper'

class MatchesControllerTest < ActionController::TestCase
  setup do
    @match = matches(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post :create, match: { date: @match.date, player1_id: @match.player1_id, player2_id: @match.player2_id, startTime: @match.startTime, title: @match.title }
    end
    assert_redirected_to match_path(assigns(:match))
  end

  test "should update match" do
    patch :update, id: @match, match: { date: @match.date, player1_id: @match.player1_id, player2_id: @match.player2_id, startTime: @match.startTime, title: @match.title }
    assert_redirected_to match_path(assigns(:match))
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete :destroy, id: @match
    end
    assert_redirected_to matches_path
  end
end
