module AnalyticsHelper
  def goal_source_powerplay_other
    pie_chart ({"Powerplay goals" => @powerplay_goal, "Other goals" => @normal_goal})
  end

  def win_lose_overtime
    pie_chart ({"Win" => @win_game, "Lose" => @lose_game, "Overtime" => @over_game}) 
  end

  def game_location_by_state
    column_chart Game.group(:state).count
  end

  def player_position_count
    column_chart Player.group(:position).count, height: '500px', library: {
      title: {text: 'Player by postion'},
      yAxis: {
        allowDecimals: false,
        title: {
          text: 'Players count'
        }
      },
      xAxis: {
        title: {
          text: 'People'
        }
      }
    }
  end

  def score_by_skater
    line_chart @participation_graph.group(:player_id).sum(:goals_skater), library: {
      title: {text: 'Score goals by players'},
      xAxis: {
        allowDecimals: false,
        title: {
          text: 'Player number'
        }
      }
    }
  end

  def goals_for_vs_goals_against
    line_chart [
		{name: "Goals scored", data: @goal_score_season },
		{name: "Goals against", data: @goal_against_season} ], library: {
      title: {text: 'Score per games'},
    }
  end


end
