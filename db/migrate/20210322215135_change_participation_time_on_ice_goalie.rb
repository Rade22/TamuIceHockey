# frozen_string_literal: true

# migration to add time on ice variable
class ChangeParticipationTimeOnIceGoalie < ActiveRecord::Migration[6.1]
  def change
    remove_column :participations, :time_on_ice_goalie, :time
    add_column :participations, :time_on_ice_goalie, :integer
  end
end
