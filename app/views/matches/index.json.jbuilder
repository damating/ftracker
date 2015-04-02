json.array!(@matches) do |match|
  json.extract! match, :id, :title, :date, :startTime, :player1_id, :player2_id
  json.url match_url(match, format: :json)
end
