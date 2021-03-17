class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.text :against_team
      t.timestamp :date
      t.time :time
      t.integer :goals_for
      t.integer :goals_against
      t.boolean :is_overtime
      t.integer :powerplay_attemps
      t.integer :killed_penalties
      t.integer :total_penalties
      t.text :city
      t.text :ring_name
      t.text :state

      t.timestamps
    end
  end
end
