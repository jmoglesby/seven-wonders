class CreateGameSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :game_sessions do |t|
      t.integer :creator_user_id
      t.timestamps
    end

    create_table :game_sessions_users do |t|
      t.belongs_to :game_session, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
