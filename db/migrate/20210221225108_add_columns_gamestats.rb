class AddColumnsGamestats < ActiveRecord::Migration[6.1]
  def change
	add_column :game_stats, :wins, :integer
	add_column :game_stats, :losses, :integer
	add_column :game_stats, :overtime_shootout_losses, :integer
	add_column :game_stats, :overtime_wins, :integer
	add_column :game_stats, :goals_for, :integer
	add_column :game_stats, :goals_against, :integer
  end
end
