# frozen_string_literal: true

class AnalyticsController < ApplicationController
  def index
    @game_order = Game.where(scrimmage: false).order(:date)

    # for the graph score per game
    @goal_score_season = []
    @temp_goal_score_season = @game_order.group(:date).group(:against_team).sum(:goals_for)
    @temp_goal_score_season.each do |temp|
      next unless temp[0][0] <= Date.today

      raw_value = temp[0]
      raw_value[0] = raw_value[0].strftime('%d %B %Y')
      raw_value[1] = " #{raw_value[1]}"
      @goal_score_season.append([raw_value, temp[1]])
    end
    @goal_against_season = []
    @temp_goal_against_season = @game_order.group(:date).group(:against_team).sum(:goals_against)
    @temp_goal_against_season.each do |temp|
      next unless temp[0][0] <= Date.today

      raw_value = temp[0]
      raw_value[0] = raw_value[0].strftime('%d %B %Y')
      raw_value[1] = " #{raw_value[1]}"
      @goal_against_season.append([raw_value, temp[1]])
    end
    # for the graph score per game

    @participation_graph = Participation.order(:player_id)

    # for the graph %win lose pie chart
    @win_game = 0
    @lose_game = 0
    @overtime_win_game = 0
    @overtime_lose_game = 0
    @game_order.each do |game|
      if game.date < Date.today && ((game.goals_for.nil? == false) && (game.goals_against.nil? == false))
        if game.is_overtime
          if game.goals_for > game.goals_against
            @overtime_win_game += 1
          else
            @overtime_lose_game += 1
          end
        elsif game.goals_for > game.goals_against
          @win_game += 1
        else
          @lose_game += 1
        end
      end
    end
    # for the graph %win lose pie chart

    @total_score = 3 * @win_game + 2 * @overtime_win_game + @overtime_lose_game
    @total_game = @win_game + @lose_game + @overtime_win_game + @overtime_lose_game
    # get total goals for
    # get total goals against

    # for the graph goal_source_powerplay_other
    @total_goal_for = @game_order.sum(:goals_for)
    @total_goal_against = @game_order.sum(:goals_against)
    @powerplay_goal = @game_order.sum(:powerplay_goals)
    @normal_goal = @total_goal_for - @powerplay_goal
    # for the graph goal_source_powerplay_other

    # for penalties_vs_powerplays
    @penalty_season = []
    @temp_penalty_season = @game_order.group(:date).group(:against_team).sum(:killed_penalties)
    @temp_penalty_season.each do |temp|
      next unless temp[0][0] <= Date.today

      raw_value = temp[0]
      raw_value[0] = raw_value[0].strftime('%d %B %Y')
      raw_value[1] = " #{raw_value[1]}"
      @penalty_season.append([raw_value, temp[1]])
    end
    @powerplay_season = []
    @temp_powerplay_season = @game_order.group(:date).group(:against_team).sum(:powerplay_attemps)
    @temp_powerplay_season.each do |temp|
      next unless temp[0][0] <= Date.today

      raw_value = temp[0]
      raw_value[0] = raw_value[0].strftime('%d %B %Y')
      raw_value[1] = " #{raw_value[1]}"
      @powerplay_season.append([raw_value, temp[1]])
    end
    # for penalties_vs_powerplays

    # for powerplays vs powerplays goals
    @powerplay_goals_season = []
    @temp_powerplay_goals_season = @game_order.group(:date).group(:against_team).sum(:powerplay_goals)
    @temp_powerplay_goals_season.each do |temp|
      next unless temp[0][0] <= Date.today

      raw_value = temp[0]
      raw_value[0] = raw_value[0].strftime('%d %B %Y')
      raw_value[1] = " #{raw_value[1]}"
      @powerplay_goals_season.append([raw_value, temp[1]])
    end
    # for powerplays vs powerplays goals
  end
end
