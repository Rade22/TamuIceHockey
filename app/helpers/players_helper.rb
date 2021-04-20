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

  def goal_score_skater 
    player_goals_raw = @player_perform.group(:game_id).sum(:goals_skater)
    temp_goal = []
    player_goals_raw.each do |participate|
      current_game = @game_info.where(id: participate[0]).first
      team_name = current_game.against_team
      game_date = current_game.date
      temp_goal.append([game_date, team_name, participate[1]])
    end

    temp_sort = temp_goal.sort{|a| a.first}
    @player_goals = []
    temp_sort.each do |temp|
      @player_goals.append([temp[1] + "  " + temp[0].strftime('%m/%d/%Y'), temp[2]] )
    end

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
    temp_assist = []
    player_assists_raw.each do |participate|
      current_game = @game_info.where(id: participate[0]).first
      team_name = current_game.against_team
      game_date = current_game.date
      temp_assist.append([game_date, team_name, participate[1]])
    end
    
    temp_sort = temp_assist.sort{|a| a.first}
    @player_assists = []
    temp_sort.each do |temp|
      @player_assists.append([temp[1] + "  " + temp[0].strftime('%m/%d/%Y'), temp[2]] )
    end


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
    temp_penalty_skater = []
    penalty_skater_raw.each do |participate|
      current_game = @game_info.where(id: participate[0]).first
      team_name = current_game.against_team
      game_date = current_game.date
      temp_penalty_skater.append([game_date, team_name, participate[1]])
    end
    
    temp_sort = temp_penalty_skater.sort{|a| a.first}
    @penalty_skater = []
    temp_sort.each do |temp|
      @penalty_skater.append([temp[1] + "  " + temp[0].strftime('%m/%d/%Y'), temp[2]] )
    end

    line_chart [{name: "Penalty time", data: @penalty_skater}], 
    colors: ["#800000"],
    library: {
      title: {text: 'Penalty minutes per games'},
      yAxis: { 
        crosshair: true,
        allowDecimals: false
      },
      xAxis: {
        crosshair: true
      }
    }
  end

  def goal_save_goalie
    shots_against_raw = @player_perform.group(:game_id).sum(:shots_against_goalie)
    temp_shot_against = []
    shots_against_raw.each do |participate|
      current_game = @game_info.where(id: participate[0]).first
      team_name = current_game.against_team
      game_date = current_game.date
      temp_shot_against.append([game_date, team_name, participate[1]])
    end
    
    temp_sort = temp_shot_against.sort{|a| a.first}
    @shots_against = []
    temp_sort.each do |temp|
      @shots_against.append([temp[1] + "  " + temp[0].strftime('%m/%d/%Y'), temp[2]] )
    end

    saves_raw = @player_perform.group(:game_id).sum(:saves_goalie)
    temp_saves = []
    saves_raw.each do |participate|
      current_game = @game_info.where(id: participate[0]).first
      team_name = current_game.against_team
      game_date = current_game.date
      temp_saves.append([game_date, team_name, participate[1]])
    end
    
    temp_sort = temp_saves.sort{|a| a.first}
    @saves = []
    temp_sort.each do |temp|
      @saves.append([temp[1] + "  " + temp[0].strftime('%m/%d/%Y'), temp[2]] )
    end

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
