module GamesHelper
  def game_identity(game)
    "vs #{game.against_team} on #{game.date.strftime("%Y-%m-%d")}"
  end
end