# frozen_string_literal: true

# helper for players module
module PlayersHelper
  def full_name(player)
    "#{player.first_name} #{player.last_name}"
  end
  
  def flash_class(level)
    bootstrap_alert_class = {
      "success" => "alert-success",
      "error" => "alert-danger",
      "notice" => "alert-info",
      "alert" => "alert-danger",
      "warn" => "alert-warning"
    }
    bootstrap_alert_class[level]
  end

  def sort_the_array_by_date(raw_data)
    temp = []
    raw_data.each do |participate|
      current_game = @game_info.where(id: participate[0]).first
      team_name = current_game.against_team
      game_date = current_game.date
      temp.append([game_date, team_name, participate[1]])
    end

    temp_sort = temp.sort{|a| a.first}
    return_array = []
    temp_sort.each do |temp|
      return_array.append([temp[1] + "  " + temp[0].strftime('%m/%d/%Y'), temp[2]] )
    end
    return return_array
  end

  def goal_score_skater 
    player_goals_raw = @player_perform.group(:game_id).sum(:goals_skater)
    @player_goals = sort_the_array_by_date(player_goals_raw)

    line_chart [{name: "Goals", data: @player_goals}],
    colors: ["#800000"], 
    library: {
      title: {text: "Goals by game"},
      xAxis: {
        crosshair: true
      },
      yAxis: {
        crosshair: true,
        allowDecimals: false
      }
    }
  end

  def goal_assist_skater
    player_assists_raw = @player_perform.group(:game_id).sum(:assists_skater)
    @player_assists = sort_the_array_by_date(player_assists_raw)

    line_chart [{name: "Goal assists", data: @player_assists}],
    colors: ["#800000"], 
    library: {
      title: {text: "Goal assists by game"},
      xAxis: {
        crosshair: true
      },
      yAxis: {
        crosshair: true,
        allowDecimals: false
      }
    }
  end

  def player_score_per_game
    @player_score = []
    for i in 0..@player_assists.size()-1
      score = @player_assists[i][1] + @player_goals[i][1]
      @player_score.append([@player_assists[i][0],score])
    end

    line_chart [{name: "Player score by game", data: @player_score}],
    colors: ["#800000"], 
    library: {
      title: {text: "Score by game"},
      xAxis: {
        crosshair: true
      },
      yAxis: {
        crosshair: true,
        allowDecimals: false
      }
    }
    
  end

  def penalty_minutes_skater
    penalty_skater_raw = @player_perform.group(:game_id).sum(:penalty_minutes_skater)
    @penalty_skater = sort_the_array_by_date(penalty_skater_raw)

    line_chart [{name: "Penalty time", data: @penalty_skater}], 
    colors: ["#800000"],
    library: {
      title: {text: 'Penalty minutes per games'},
      yAxis: { 
        crosshair: true,
        allowDecimals: false,
        title: {text: 'Minutes'}
      },
      xAxis: {
        crosshair: true
      }
    }
  end

  def goal_save_goalie
    shots_against_raw = @player_perform.group(:game_id).sum(:shots_against_goalie)
    @shots_against = sort_the_array_by_date(shots_against_raw)

    saves_raw = @player_perform.group(:game_id).sum(:saves_goalie)
    @saves = sort_the_array_by_date(saves_raw)

    line_chart [{name: "Shots against", data: @shots_against},
                {name: "Saves", data: @saves}],
    colors: ["#800000","#000"], 
    library: {
      title: {text: "Shots against vs Saves by game"},
      xAxis: {
        crosshair: true
      },
      yAxis: {
        crosshair: true,
        allowDecimals: false,
        title: {text: "Attempts"}
      }
    }
  end

  def time_on_ice_goalie 
    player_time_raw = @player_perform.group(:game_id).sum(:time_on_ice_goalie)
    temp_player_time = []
    player_time_raw.each do |participate|
      current_game = @game_info.where(id: participate[0]).first
      team_name = current_game.against_team
      game_date = current_game.date
      temp_player_time.append([game_date, team_name, participate[1]])
    end
    
    temp_sort = temp_player_time.sort{|a| a.first}
    @player_time = []
    temp_sort.each do |temp|
      @player_time.append([temp[1] + "  " + temp[0].strftime('%m/%d/%Y'), temp[2]] )
    end
    
    line_chart [{name: "Time on ice", data: @player_time}],
    colors: ["#800000"], 
    library: {
      title: {text: "Time on ice by game"},
      xAxis: {
        crosshair: true,
      },
      yAxis: {
        crosshair: true,
        allowDecimals: false,
        title: {text: "Minutes"}
      }
    }
  end
end
