require 'test_helper'

class PlayerLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @player = players(:one)
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, session: { email: @player.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to @player
    follow_redirect!
    assert_template 'player/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", player_path(@player)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", player_path(@player), count: 0

  end

end
