class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.integer :team_id
      t.string :name
      t.string :logo
      t.string :country
      t.boolean :is_national
      t.integer :founded
      t.string :venue_name
      t.string :venue_surface
      t.string :venue_address
      t.string :venue_city
      t.integer :venue_capacity

      t.timestamps
    end
  end
end
