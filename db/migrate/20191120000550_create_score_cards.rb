class CreateScoreCards < ActiveRecord::Migration[6.0]
  def change
    create_table :score_cards do |t|
      t.integer :plus_one_military_victory_tokens
      t.integer :plus_three_military_victory_tokens
      t.integer :plus_five_military_victory_tokens
      t.integer :plus_seven_military_victory_tokens
      t.integer :minus_one_military_victory_tokens
      t.integer :minus_two_military_victory_tokens
      t.integer :minus_three_military_victory_tokens
      t.integer :coin_total
      t.integer :debt_total
      t.integer :wonder_points
      t.integer :blue_card_points
      t.integer :yellow_card_points
      t.integer :black_card_points
      t.integer :purple_card_points
      t.integer :tablet_symbols
      t.integer :cog_symbols
      t.integer :compass_symbols
      t.integer :wildcard_symbols
      t.integer :leader_points
      t.integer :fleet_points
      t.integer :babel_tiles_played
      t.integer :great_project_token_points
      t.integer :great_project_penalty_total
      t.integer :user_id
      t.integer :game_session_id

      t.timestamps
    end

    add_index :score_cards, :user_id
    add_index :score_cards, :game_session_id
  end
end
