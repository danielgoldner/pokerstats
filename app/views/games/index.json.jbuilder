json.array!(@games) do |game|
  json.extract! game, :id, :played, :buyin, :winnings, :profit, :gametype
  json.url game_url(game, format: :json)
end
