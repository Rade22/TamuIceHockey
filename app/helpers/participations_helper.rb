# frozen_string_literal: true

# helper for participation module
module ParticipationsHelper
    def game_date(game)
        "(#{game.date.strftime('%m-%d-%y')})"
    end

    def game_identity(game)
        "#{game.against_team}"
    end
end
