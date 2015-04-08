require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
 
 def setup
@player = players(:one)
 end

 test "should be valid" do
   assert @player.valid?
 end

 test "first name should be present" do
   @player.first_name = "     "
   assert_not @player.valid?
 end

 test "last name should be present" do
   @player.last_name = "    "
   assert_not @player.valid?
 end

 test "first name should not be too long" do
   @player.first_name = "a" * 51
   assert_not @player.valid?
 end

 test "last name should not be too long" do
   @player.last_name = "a" * 51
   assert_not @player.valid?
 end
 
 test "email should be present" do
   @player.email = "     "
   assert_not @player.valid?
 end

 test "email should not be too long" do
   @player.email = "a" * 256
   assert_not @player.valid?
 end

 test "email addresses should be unique" do
   duplicate_player = @player.dup
   duplicate_player.email = @player.email.upcase
   @player.save
   assert_not duplicate_player.valid?
 end

   test "password should have a minimum length" do
    @player.password = @player.password_confirmation = "a" * 5
    assert_not @player.valid?
  end


end
