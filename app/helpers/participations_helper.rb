# frozen_string_literal: true

# helper for participation module
module ParticipationsHelper

  def flash_class(level)
  bootstrap_alert_class = {
    "success" => "alert-success",
    "error" => "alert-danger",
    "notice" => "alert-info",
    "alert" => "alert-danger",
    "warn" => "alert-warning"
  }
  bootstrap_alert_class[level]

    def game_date(game)
        "(#{game.date.strftime('%m-%d-%y')})"
    end

    def game_identity(game)
        "#{game.against_team}"
    end
end
