require 'test_helper'

class PlayersSignupTest < ActionDispatch::IntegrationTest

test "invalid signup information" do
    get signup_path
    assert_no_difference 'Player.count' do
    post players_path, player: { 	first_name:  "",
									last_name:  "",
                               						email: "player@invalid",
                              						password: "pass",
                              						password_confirmation: "word" }
    end
    assert_template 'players/new'
  end

test "valid signup information" do
    get signup_path
    assert_difference 'Player.count', 1 do
      post_via_redirect players_path, player: {  first_name:  "Example name",
												  last_name:  "Example last name",
                                          							  email: "player@example.com",
                                           							  password: "password",
                                            							  password_confirmation: "password" }
    end
    assert_template 'players/show'
  end

end
