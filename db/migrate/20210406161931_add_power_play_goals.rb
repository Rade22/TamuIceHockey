# frozen_string_literal: true

# migration to add PowerPlayGoals to games
class AddPowerPlayGoals < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :PowerPlayGoals, :integer
  end
end
