class AnalyticsController < ApplicationController
  def index
    @game_graph = Game.order(:date)
  end
end
