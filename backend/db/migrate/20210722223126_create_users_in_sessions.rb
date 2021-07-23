class CreateUsersInSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :users_in_sessions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :session, index: true,  foreign_key: true

      t.timestamps
    end
  end
end
