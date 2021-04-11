# frozen_string_literal: true

# migration to add scrimmage variable
class AddScrimmage < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :scrimmage, :boolean
  end
end
