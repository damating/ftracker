class Player < ActiveRecord::Base
  
  before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: { maximum: 50 } 
  validates :last_name,  presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
		    format: { with: VALID_EMAIL_REGEX },
		    uniqueness: { case_sensitive: false }

  has_many :matches, dependent: :destroy
  has_many :goals

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
 validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
 
  # Returns the hash digest of the given string.
  def Player.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def get_full_name
	"#{first_name} #{last_name}"
  end

def  played_matches
    #Match.where(player1_id: id) + Match.where(player2_id: id)
    Match.where("player1_id = ? OR player2_id = ?", id, id)
  end

def  played_matches_show
Match.where("player1_id = ? OR player2_id = ?", id, id)
  end

def  won_matches
    #Match.where("player1_goals = ? AND player1_id = ?", 10, id) + Match.where("player2_goals = ? AND player2_id = ?", 10, id)
     Match.where("(player1_goals = ? AND player1_id = ?) OR (player2_goals = ? AND player2_id = ?)", 10, id,10, id)
end

def  lost_matches
     Match.where("(player1_id = ? AND player1_goals < player2_goals) OR (player2_id = ? AND player1_goals > player2_goals)", id, id)
end

def get_points
	won_matches.count * 3 - lost_matches.count * 1 
end





end
