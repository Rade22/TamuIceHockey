class CreateParticipations < ActiveRecord::Migration[6.1]
  def change
    create_table :participations do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :player_stats_id

      t.timestamps
    end
  end
end
