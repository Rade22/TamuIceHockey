class GameDateTimestamp < ActiveRecord::Migration[6.1]
  def change
	change_column :games, :date, :timestamptz
  end
end
