class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :profile_img
      t.integer :team_id

      t.timestamps
    end
  end
end
