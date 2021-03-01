# frozen_string_literal: true

# migration
class Newplayerstats < ActiveRecord::Migration[6.1]
  def change
    add_column :participations, :time_on_ice, :integer
    add_column :participations, :goals, :integer
    add_column :participations, :assists, :integer
    add_column :participations, :penalty_minutes, :integer
    add_column :participations, :powerplay_goals, :integer
  end
end
