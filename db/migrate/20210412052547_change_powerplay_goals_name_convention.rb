class ChangePowerplayGoalsNameConvention < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :PowerPlayGoals
    add_column :games, :powerplay_goals, :integer
  end
end
