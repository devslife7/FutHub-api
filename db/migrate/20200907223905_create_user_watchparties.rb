class CreateUserWatchparties < ActiveRecord::Migration[6.0]
  def change
    create_table :user_watchparties do |t|
      t.references :user, null: false, foreign_key: true
      t.references :watchparty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
