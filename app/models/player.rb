class Player < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 50 } 
  validates :last_name,  presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
		    format: { with: VALID_EMAIL_REGEX },
		    uniqueness: { case_sensitive: false }

  has_many :matches
  has_many :goals
end
