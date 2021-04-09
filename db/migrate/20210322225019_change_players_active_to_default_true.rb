# frozen_string_literal: true

# migration to make active variable default true
class ChangePlayersActiveToDefaultTrue < ActiveRecord::Migration[6.1]
  def change
    change_column_default :players, :active, from: nil, to: true
  end
end
