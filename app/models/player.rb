class Player < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 50 } 
  validates :last_name,  presence: true, length: { maximum: 50 }

  has_many :matches
  has_many :goals
end
