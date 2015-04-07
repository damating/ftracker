class AddDetailsToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :player1_goals, :integer
    add_column :matches, :player2_goals, :integer
  end
end
