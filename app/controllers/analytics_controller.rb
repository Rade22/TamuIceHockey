class AnalyticsController < ApplicationController
  def index
    #for the graph score per game
    @goal_score_season = []
    @temp_goal_score_season = Game.order(:date).group(:date).group(:against_team).sum(:goals_for)
    @temp_goal_score_season.each do |temp|
      raw_value = temp[0]
      raw_value[0] = raw_value[0].strftime("%Y %m %d")
      @goal_score_season.append([raw_value,temp[1]])
    end
    @goal_against_season = []
    @temp_goal_against_season = Game.order(:date).group(:date).group(:against_team).sum(:goals_against)
    @temp_goal_against_season.each do |temp|
      raw_value = temp[0]
      raw_value[0] = raw_value[0].strftime("%Y %m %d")
      @goal_against_season.append([raw_value,temp[1]])
    end
    #for the graph score per game

    @game_graph = Game.order(:date)
    
    @participation_graph = Participation.order(:player_id)
    
    @win_game = 4
    @lose_game = 1
    @over_game = 2

  end
end
