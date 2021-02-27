# frozen_string_literal: true

# migration
class PlayerStatsAddColumns < ActiveRecord::Migration[6.1]
  def change
    change_table :player_stats do |t|
      t.integer :playerid
      t.integer :gameid
    end
  end
end
