class CreateGameStats < ActiveRecord::Migration[6.1]
  def change
    create_table :game_stats do |t|
      t.text :opposing_team
      t.date :date
      t.text :location
      t.integer :home_score
      t.integer :opposing_score

      t.timestamps
    end
  end
end
