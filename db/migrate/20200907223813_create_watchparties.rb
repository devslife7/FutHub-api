class CreateWatchparties < ActiveRecord::Migration[6.0]
  def change
    create_table :watchparties do |t|
      t.string :name
      t.string :time
      t.integer :timestamp
      t.string :location
      t.string :creator_name
      t.integer :creator_id
      t.string :league_name
      t.string :league_logo
      t.string :home_team_name
      t.string :home_team_logo
      t.string :away_team_name
      t.string :away_team_logo

      t.timestamps
    end
  end
end
