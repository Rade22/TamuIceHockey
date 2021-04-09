# frozen_string_literal: true

# analytics controller
class AnalyticsController < ApplicationController
  def index
    @game_graph = Game.order(:date)
    @participation_graph = Participation.order(:player_id)
  end
end
