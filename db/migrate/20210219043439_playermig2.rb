class Playermig2 < ActiveRecord::Migration[6.1]
    def change
      change_column_null :players, :last_name, false
  
      change_column_null :games, :against_team, false
      change_column_null :games, :date, false
      change_column_null :games, :location, false
    end
  end