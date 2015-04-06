class AddAvatarToPlayers < ActiveRecord::Migration
  def change
	add_attachment :players, :avatar
  end
end
