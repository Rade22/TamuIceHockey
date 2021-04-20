module AnalyticsHelper
  def goal_source_powerplay_other
    pie_chart ({"Powerplay goals" => @powerplay_goal, "Other goals" => @normal_goal}),
    colors: ["#000", "#800000"],
    library: {
      title: {text: 'Goals source'}
    }
  end

  def win_lose_overtime
    pie_chart ({"Won" => @win_game, "Won Overtime" => @overtime_win_game, "Lost" => @lose_game, "Lost Overtime" => @overtime_lose_game}), 
    colors: ["#800000", "#8B0000", "#72435C", "#7B435C"],
    library: {
      title: {text: 'Result of game'}
    } 
  end

  def game_location_by_state
    column_chart Game.group(:state).count, 
    colors: ["#800000"],
    library: {
      title: {text: 'Game location by states'}
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
          text: 'Number of players'
        }
      }
    }
  end

  def score_by_skater
    @goal_by_player_id = @participation_graph.group(:player_id).sum(:goals_skater)
    @player_goal_by_game = []
    @goal_by_player_id.each do |participate|
      cur_player = Player.find(participate[0])
      name_cur_player = cur_player.last_name
      number_cur_player = cur_player.number
      @player_goal_by_game.append([name_cur_player + " " + number_cur_player.to_s, participate[1]])
    end
    line_chart [{name: "Total goals", data: @player_goal_by_game}], 
    colors: ["#800000"],
    library: {
      title: {text: 'Total scored goals by each player'},
      xAxis: {
        crosshair: true,
        title: {
          text: 'Player number'
        }
      },
      yAxis: {
        crosshair: true,
        allowDecimals: false
      }
    }
  end

  def assist_by_skater
    @assist_by_player_id = @participation_graph.group(:player_id).sum(:assists_skater)
    @player_assist_by_game = []
    @assist_by_player_id.each do |participate|
      cur_player = Player.find(participate[0])
      name_cur_player = cur_player.last_name
      number_cur_player = cur_player.number
      @player_assist_by_game.append([name_cur_player + " " + number_cur_player.to_s, participate[1]])
    end
    line_chart [{name: "Total assists", data: @player_assist_by_game}], 
    colors: ["#800000"],
    library: {
      title: {text: 'Total goal assists by each player'},
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
		{name: "Goals for", data: @goal_score_season },
		{name: "Goals against", data: @goal_against_season} ],
    colors: ["#800000","#000"], library: {
      title: {text: 'Goals per game'},
      yAxis: {
        crosshair: true,
        allowDecimals: false
      },
      xAxis: {
        crosshair: true
      }
    }
  end


  def penalties_vs_powerplays
    line_chart [
      {name: "Powerplays", data: @powerplay_season} ,
      {name: "Penalty kills", data: @penalty_season}], 
    colors: ["#800000","#000"],
    library: {
      title: {text: 'Powerplays vs Penalty kills per game'},
      yAxis: { 
        crosshair: true,
        allowDecimals: false
      },
      xAxis: {
        crosshair: true
      }
    }
  end
  
  def powerplays_vs_powerplay_goals
    line_chart [
      {name: "Powerplays", data: @powerplay_season} ,
      {name: "Powerplay goals", data: @powerplay_goals_season}],
    colors: ["#800000","#000"],
    library: {
      title: {text: 'Powerplays vs Powerplay goals per game'},
      yAxis: { 
        crosshair: true,
        allowDecimals: false
      },
      xAxis: {
        crosshair: true
      }
    }
  end

end
