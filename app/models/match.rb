class Match < ActiveRecord::Base
  belongs_to :player1, :class_name => "Player"
  belongs_to :player2, :class_name => "Player"
  has_many :goals, :dependent => :destroy

  def match_result
	"#{player1_goals} : #{player2_goals}"
  end

  def won_match(player_id)
	if (player1_goals != player2_goals)
		if (player1_goals == 10 && player1_id == player_id)
			num_wins += 1
		elseif (player2_goals == 10 && player2_id == player_id)
			num_wins += 1
		end
	end
	num_wins
  end
  
end
