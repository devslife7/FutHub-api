class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.string :sender
      t.string :location
      t.integer :watchparty_id
      t.integer :time
      t.string :timestamp
      t.string :home_team_name
      t.string :home_team_logo
      t.string :away_team_name
      t.string :away_team_logo

      t.timestamps
    end
  end
end
