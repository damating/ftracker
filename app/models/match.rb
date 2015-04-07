class Match < ActiveRecord::Base
  belongs_to :player1, :class_name => "Player"
  belongs_to :player2, :class_name => "Player"
  has_many :goals, :dependent => :destroy

 scope :created, -> { order(created_at: :desc) }
 scope :created_after, ->(date) { where("date > ?", date) }


  def match_result
	"#{player1_goals} : #{player2_goals}"
  end

 def self.upcoming_matches
	created_after(Time.zone.now)
  end
  
end
