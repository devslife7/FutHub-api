class CreateWatchparties < ActiveRecord::Migration[6.0]
  def change
    create_table :watchparties do |t|

      t.timestamps
    end
  end
end
