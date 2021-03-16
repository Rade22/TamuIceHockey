class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.text :first_name, null: false
      t.text :last_name, null: false
      t.integer :number
      t.text :position, null: false
      t.boolean :active
      t.text :image_link

      t.timestamps
    end
  end
end
