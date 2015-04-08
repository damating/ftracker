require 'test_helper'

class PlayerLoginTest < ActionDispatch::IntegrationTest

  def setup
    @player = players(:one)
#@player = Player.new(first_name: "Example Player", last_name: "Example Player", email: "player@example.com", password: "foobar", password_confirmation: "foobar")
  end

 test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    post login_path, session: { email: @player.email, password: 'password'}
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", player_path(@player)
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, session: { email: @player.email, password: @player.password }
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
