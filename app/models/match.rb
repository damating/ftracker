class Match < ActiveRecord::Base
  belongs_to :player1, :class_name => "Player"
  belongs_to :player2, :class_name => "Player"
  has_many :goals, :dependent => :destroy
end
