class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :session_title
      t.integer :spots_available
      t.integer :total_spots
      t.timestamp :start_date
      t.timestamp :start_time
      t.timestamp :end_time

      t.timestamps
    end
  end
end
