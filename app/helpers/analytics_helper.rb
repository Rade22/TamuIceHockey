module AnalyticsHelper
  def goal_source_powerplay_other
    pie_chart ({"Powerplay goals" => @powerplay_goal, "Other goals" => @normal_goal}),
    colors: ["#800000", "#8B0000"],
    library: {
      title: {text: 'Goals source'}
    }
  end

  def win_lose_overtime
    pie_chart ({"Win" => @win_game, "Win Overtime" => @overtime_win_game, "Lose" => @lose_game, "Lose Overtime" => @overtime_lose_game}), 
    colors: ["#800000", "#8B0000", "#72435C", "#7B435C"],
    library: {
      title: {text: 'Result of game'}
    } 
  end

  def game_location_by_state
    column_chart Game.group(:state).count, 
    colors: ["#800000"],
    library: {
      title: {text: 'Game loccation by states'}
    }
  end

  def player_position_count
    column_chart Player.group(:position).count, height: '500px', 
    colors: ["#800000"],
    library: {
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
    line_chart [{name: "Total goals", data: @participation_graph.group(:player_id).sum(:goals_skater)}], 
    colors: ["#800000"],
    library: {
      title: {text: 'Total score goals by players'},
      xAxis: {
        crosshair: true,
        allowDecimals: false,
        title: {
          text: 'Player number'
        }
      },
      yAxis: {
        crosshair: true
      }
    }
  end

  def assist_by_skater
    line_chart [{name: "Total assists", data: @participation_graph.group(:player_id).sum(:assists_skater)}], 
    colors: ["#800000"],
    library: {
      title: {text: 'Total score assists by players'},
      xAxis: {
        crosshair: true,
        allowDecimals: false,
        title: {
          text: 'Player number'
        }
      },
      yAxis: {
        crosshair: true
      }
    }
  end

  def goals_for_vs_goals_against
    line_chart [
		{name: "Goals scored", data: @goal_score_season },
		{name: "Goals against", data: @goal_against_season} ],
    colors: ["#800000","#000"], library: {
      title: {text: 'Goal per games'},
      yAxis: { 
        crosshair: true
      },
      xAxis: {
        crosshair: true
      }
    }
  end


  def penalties_vs_powerplays
    line_chart [
      {name: "Power plays", data: @powerplay_season} ,
      {name: "Penaltie kills", data: @penalty_season}], 
    colors: ["#800000","#000"],
    library: {
      title: {text: 'Power plays vs Penaltie kills per games'},
      yAxis: { 
        crosshair: true
      },
      xAxis: {
        crosshair: true
      }
    }
  end
  
  def powerplays_vs_powerplay_goals
    line_chart [
      {name: "Power plays", data: @powerplay_season} ,
      {name: "Power play goals", data: @powerplay_goals_season}],
    colors: ["#800000","#000"],
    library: {
      title: {text: 'Power plays vs Power play goals per games'},
      yAxis: { 
        crosshair: true
      },
      xAxis: {
        crosshair: true
      }
    }
  end

end
