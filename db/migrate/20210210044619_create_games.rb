class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :against_team
      t.timestamp :date
      t.string :location
      t.integer :score
      t.integer :opposing_score
      t.integer :game_stats_id

      t.timestamps
    end
  end
end
