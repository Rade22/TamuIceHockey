class PlayersNotNull < ActiveRecord::Migration[6.1]
  def change
	change_column_null :players, :first_name, false
	change_column_null :players, :last_name, false
	change_column_null :players, :position, false
	change_column_null :players, :number, true
  end
end
