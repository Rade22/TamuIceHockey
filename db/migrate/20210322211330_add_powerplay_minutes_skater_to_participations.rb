class AddPowerplayMinutesSkaterToParticipations < ActiveRecord::Migration[6.1]
  def change
    add_column :participations, :powerplay_minutes_skater, :integer
  end
end
