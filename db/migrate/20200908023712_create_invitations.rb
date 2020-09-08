class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.string :sender
      t.integer :match_id
      t.string :homeTeamName
      t.string :awayTeamName
      t.string :homeTeamLogo
      t.string :awayTeamLogo
      t.string :location
      t.string :date
      t.integer :time

      t.timestamps
    end
  end
end
