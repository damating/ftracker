require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
 
 def setup
   @player = Player.new(first_name: "Example Player", last_name: "Example Player                        ", avatar: "http://exampleurl.pl")
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
 
end
