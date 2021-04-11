class AnalyticsController < ApplicationController
  def index
    @game_order = Game.where(scrimmage: false).order(:date)
    
    #for the graph score per game
    @goal_score_season = []
    @temp_goal_score_season = @game_order.group(:date).group(:against_team).sum(:goals_for)
    @temp_goal_score_season.each do |temp|
      if temp[0][0] <= Date.today
        raw_value = temp[0]
        raw_value[0] = raw_value[0].strftime("%d %B %Y")
        raw_value[1] = " " + raw_value[1]
        @goal_score_season.append([raw_value, temp[1]])
      end
    end
    @goal_against_season = []
    @temp_goal_against_season = @game_order.group(:date).group(:against_team).sum(:goals_against)
    @temp_goal_against_season.each do |temp|
      if temp[0][0] <= Date.today
        raw_value = temp[0]
        raw_value[0] = raw_value[0].strftime("%d %B %Y")
        raw_value[1] = " " + raw_value[1]
        @goal_against_season.append([raw_value, temp[1]])
      end
    end
    #for the graph score per game


    
    @participation_graph = Participation.order(:player_id)
    

    #for the graph %win lose pie chart
    @win_game = 0
    @lose_game = 0
    @over_game = 0
    @game_order.each do |game|
      if game.date < Date.today
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
    end
    #for the graph %win lose pie chart

    #for the graph goal_source_powerplay_other
    @total_goal = @game_order.sum(:goals_for)
    @powerplay_goal = @game_order.sum(:PowerPlayGoals)
    @normal_goal = @total_goal - @powerplay_goal
    #for the graph goal_source_powerplay_other

    #for penalties_vs_powerplays
    @penalty_season = []
    @temp_penalty_season =  @game_order.group(:date).group(:against_team).sum(:killed_penalties)
    @temp_penalty_season.each do |temp|
      if temp[0][0] <= Date.today
        raw_value = temp[0]
        raw_value[0] = raw_value[0].strftime("%d %B %Y")
        raw_value[1] = " " + raw_value[1]
        @penalty_season.append([raw_value, temp[1]])
      end
    end
    @powerplay_season = []
    @temp_powerplay_season = @game_order.group(:date).group(:against_team).sum(:powerplay_attemps)
    @temp_powerplay_season.each do |temp|
      if temp[0][0] <= Date.today
        raw_value = temp[0]
        raw_value[0] = raw_value[0].strftime("%d %B %Y")
        raw_value[1] = " " + raw_value[1]
        @powerplay_season.append([raw_value, temp[1]])
      end
    end
    #for penalties_vs_powerplays

  end
end
