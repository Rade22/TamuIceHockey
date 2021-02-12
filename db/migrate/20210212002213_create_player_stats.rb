class CreatePlayerStats < ActiveRecord::Migration[6.1]
  def change
    create_table :player_stats do |t|
      t.integer :games_played
      t.integer :wins
      t.integer :losses
      t.integer :overtime_shootout_losses
      t.integer :goals_against
      t.integer :time_on_ice
      t.integer :goals
      t.integer :assists
      t.integer :penalty_minutes
      t.integer :powerplay_goals

      t.timestamps
    end
  end
end
