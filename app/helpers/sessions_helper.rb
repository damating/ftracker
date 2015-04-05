module SessionsHelper

 #Logs in the given player
 def log_in(player)
   session[:player_id] = player.id
 end

 # Returns the current logged-in player (if any).
  def current_player
    @current_player ||= Player.find_by(id: session[:player_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_player.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:player_id)
    @current_player = nil
  end

end
