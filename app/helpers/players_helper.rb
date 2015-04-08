module PlayersHelper

  # Returns the Gravatar for the given player
  def gravatar_for(player, options = { size:80 } )
    gravatar_id = Digest::MD5::hexdigest(player.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    avatar_url = player.avatar? ? player.avatar.url : gravatar_url
    image_tag avatar_url
  end

end