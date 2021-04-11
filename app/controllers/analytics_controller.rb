class AnalyticsController < ApplicationController
  def index

    #for the graph score per game
    @goal_score_season = []
    @temp_goal_score_season = Game.order(:date).group(:date).group(:against_team).sum(:goals_for)
    @temp_goal_score_season.each do |temp|
      raw_value = temp[0]
      raw_value[0] = raw_value[0].strftime("%d %B %Y")
      raw_value[1] = " " + raw_value[1]
      @goal_score_season.append([raw_value, temp[1]])
    end
    @goal_against_season = []
    @temp_goal_against_season = Game.order(:date).group(:date).group(:against_team).sum(:goals_against)
    @temp_goal_against_season.each do |temp|
      raw_value = temp[0]
      raw_value[0] = raw_value[0].strftime("%d %B %Y")
      raw_value[1] = " " + raw_value[1]
      @goal_against_season.append([raw_value, temp[1]])
    end
    #for the graph score per game

    @game_order = Game.order(:date)
    
    @participation_graph = Participation.order(:player_id)
    

    #for the graph %win lose pie chart
    @win_game = 0
    @lose_game = 0
    @over_game = 0
    @game_order.each do |game|
      if game.goals_for.nil? == false and game.goals_against.nil? == false
        if game.is_overtime
          @over_game += 1
        elsif game.goals_for > game.goals_against
          @win_game += 1
        else
          @lose_game += 1
        end
      end
    end
    #for the graph %win lose pie chart

    @total_goal = @game_order.sum(:goals_for)
    @powerplay_goal = @game_order.sum(:PowerPlayGoals)
    @normal_goal = @total_goal - @powerplay_goal
  end
end
