module PlayersHelper

  # Returns the Gravatar for the given player
  def gravatar_for(player)
    gravatar_id = player.id
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: player.first_name, class: "gravatar")
  end

end
