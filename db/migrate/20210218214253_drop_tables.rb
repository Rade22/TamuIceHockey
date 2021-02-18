class DropTables < ActiveRecord::Migration[6.1]
  def change
	drop_table :games
	drop_table :participations
  end
end
