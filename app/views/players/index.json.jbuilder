json.array!(@players) do |player|
  json.extract! player, :id, :first_name, :last_name, :avatar, :email, :password
  json.url player_url(player, format: :json)
end
