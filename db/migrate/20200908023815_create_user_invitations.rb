class CreateUserInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_invitations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :invitation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
