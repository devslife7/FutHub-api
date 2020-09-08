class AddPropertiesToWatchparties < ActiveRecord::Migration[6.0]
  def change
    add_column :watchparties, :name, :string
    add_column :watchparties, :time, :integer
    add_column :watchparties, :location, :string
    add_column :watchparties, :creator_name, :string
  end
end
