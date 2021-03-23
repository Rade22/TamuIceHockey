class AddScrimmage < ActiveRecord::Migration[6.1]
  def change
	add_column :games, :scrimmage, :boolean
  end
end
