class Playermig < ActiveRecord::Migration[6.1]
  def change
    change_column_null :players, :first_name, :last_name false

  end
end
