class Gamestats < ActiveRecord::Migration[6.1]
    def change
      add_column :games, :wins, :integer
      add_column :games, :losses, :integer
      add_column :games, :overtime_shootout_losses, :integer
      add_column :games, :overtime_wins, :integer
      add_column :games, :goals_for, :integer
      add_column :games, :goals_against, :integer
    end
  end