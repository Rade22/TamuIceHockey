class DropTables < ActiveRecord::Migration[6.1]
  def change
	drop_table :players
	drop_table :participations
	drop_table :logins
	drop_table :games
  end
end
