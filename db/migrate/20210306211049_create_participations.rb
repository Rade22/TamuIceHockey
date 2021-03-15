class CreateParticipations < ActiveRecord::Migration[6.1]
  def change
    create_table :participations do |t|
      t.integer :player_id
      t.integer :game_id

      t.time :time_on_ice_goalie
      t.integer :shots_against_goalie
      t.integer :saves_goalie
      t.integer :goals_against_goalie

      t.integer :goals_skater
      t.integer :assists_skater
      t.integer :penalty_minutes_skater
      t.integer :powerplay_goals_skater

      t.timestamps
    end
  end
end
