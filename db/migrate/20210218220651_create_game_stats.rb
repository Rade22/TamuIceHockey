class CreateGameStats < ActiveRecord::Migration[6.1]
  def change
    create_table :game_stats do |t|
      t.string :opposing_team
      t.date :date
      t.string :location
      t.integer :home_score
      t.integer :opposing_score

      t.timestamps
    end
  end
end
