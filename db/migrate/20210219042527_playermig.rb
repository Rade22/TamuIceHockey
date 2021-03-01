# frozen_string_literal: true

# migration
class Playermig < ActiveRecord::Migration[6.1]
  def change
    change_column_null :players, :first_name, :last_name
  end
end
