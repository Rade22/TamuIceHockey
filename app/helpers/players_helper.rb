module PlayersHelper
  def full_name(player)
   "#{player.first_name} #{player.last_name}"
  end
end
