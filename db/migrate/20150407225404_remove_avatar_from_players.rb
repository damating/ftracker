class RemoveAvatarFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :avatar, :text
  end
end
