class CreateLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :leagues do |t|
      t.integer :league_id
      t.string :name
      t.string :league_type
      t.string :country
      t.integer :season
      t.string :season_start
      t.string :season_end
      t.string :logo
      t.string :flag
      t.integer :standings
      t.integer :is_current

      t.timestamps
    end
  end
end
