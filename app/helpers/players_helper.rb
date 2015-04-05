module PlayersHelper

  # Returns the Gravatar for the given player
  def gravatar_for(player, options = { size:80 } )
    gravatar_id = Digest::MD5::hexdigest(player.email.downcase) #player.id
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: player.first_name, class: "gravatar")
  end

end