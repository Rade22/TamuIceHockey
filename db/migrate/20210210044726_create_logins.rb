class CreateLogins < ActiveRecord::Migration[6.1]
  def change
    create_table :logins do |t|
      t.string :username
      t.string :hashed_password

      t.timestamps
    end
  end
end