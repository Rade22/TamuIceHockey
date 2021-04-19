# frozen_string_literal: true

# helper for players module
module PlayersHelper
  def full_name(player)
    "#{player.first_name} #{player.last_name}"
  end

  def goal_score_skater 
    @player_goals_raw = @player_perform.group(:game_id).sum(:goals_skater)
    @player_goals = []
    @player_goals_raw.each do |participate|
      @print_out = participate[0]
      @print_out_2 = participate[1]
      @current_game = @game_info.where(id: participate[0]).first
      @player_goals.append([@current_game.against_team, participate[1]])
    end
    
    line_chart [{name: "Goals", data: @player_goals}],
    colors: ["#800000"], 
    library: {
      title: {text: "Goals by game"},
      xAxis: {
        crosshair: true
      },
      yAxis: {
        crosshair: true
      }
    }
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


  def goal_assist_skater
    @player_assists_raw = @player_perform.group(:game_id).sum(:assists_skater)
    @player_assists = []
    @player_assists_raw.each do |participate|
      @print_out = participate[0]
      @current_game = @game_info.where(id: participate[0]).first
      team_name = @current_game.against_team
      @player_assists.append([@current_game.against_team, participate[1]])
    end 

    line_chart [{name: "Goal assists", data: @player_assists}],
    colors: ["#800000"], 
    library: {
      title: {text: "Goal assists by game"},
      xAxis: {
        crosshair: true
      },
      yAxis: {
        crosshair: true
      }
    }
  end 

  def penalty_minutes_skater
    @penalty_skater_raw = @player_perform.group(:game_id).sum(:penalty_minutes_skater)
    @penalty_skater = []
    @penalty_skater_raw.each do |participate|
      @print_out = participate[0]
      @current_game = @game_info.where(id: participate[0]).first
      team_name = @current_game.against_team
      @penalty_skater.append([@current_game.against_team, participate[1]])
    end
    line_chart [{name: "Penalty time", data: @penalty_skater}], 
    colors: ["#800000"],
    library: {
      title: {text: 'Penalty minutes per games'},
      yAxis: { 
        crosshair: true
      },
      xAxis: {
        crosshair: true
      }
    }
  end

  def goal_save_goalie
    @shots_against_raw = @player_perform.group(:game_id).sum(:shots_against_goalie)
    @shots_against = []
    @shots_against_raw.each do |participate|
      @print_out = participate[0]
      @print_out_2 = participate[1]
      @current_game = @game_info.where(id: participate[0]).first
      @shots_against.append([@current_game.against_team, participate[1]])
    end

    @saves_raw = @player_perform.group(:game_id).sum(:saves_goalie)
    @saves = []
    @saves_raw.each do |participate|
      @print_out = participate[0]
      @print_out_2 = participate[1]
      @current_game = @game_info.where(id: participate[0]).first
      @saves.append([@current_game.against_team, participate[1]])
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
        crosshair: true
      }
    }
  end
end
