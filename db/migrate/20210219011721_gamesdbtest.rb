class Gamesdbtest < ActiveRecord::Migration[6.1]
    def change
      change_table :games do |t|
        t.remove :against_team
        t.remove :date
        t.remove :location
        t.remove :score
        t.remove :opposing_score
        t.remove :game_stats_id
        
  
        t.text :against_team, :null => true
        t.timestamp :date, :null => true
        t.text :location, :null => true
        t.integer :score, :null => true
        t.integer :opposing_score, :null => true
        t.integer :game_stats_id, :null => true
  
      end
    end
  end