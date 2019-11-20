class AddDefaultsToScoreCards < ActiveRecord::Migration[6.0]
  def change
    change_column_default :score_cards, :plus_one_military_victory_tokens, 0
    change_column_default :score_cards, :plus_three_military_victory_tokens, 0
    change_column_default :score_cards, :plus_five_military_victory_tokens, 0
    change_column_default :score_cards, :plus_seven_military_victory_tokens, 0
    change_column_default :score_cards, :minus_one_military_victory_tokens, 0
    change_column_default :score_cards, :minus_two_military_victory_tokens, 0
    change_column_default :score_cards, :minus_three_military_victory_tokens, 0
    change_column_default :score_cards, :coin_total, 0
    change_column_default :score_cards, :debt_total, 0
    change_column_default :score_cards, :wonder_points, 0
    change_column_default :score_cards, :blue_card_points, 0
    change_column_default :score_cards, :yellow_card_points, 0
    change_column_default :score_cards, :black_card_points, 0
    change_column_default :score_cards, :purple_card_points, 0
    change_column_default :score_cards, :tablet_symbols, 0
    change_column_default :score_cards, :cog_symbols, 0
    change_column_default :score_cards, :compass_symbols, 0
    change_column_default :score_cards, :wildcard_symbols, 0
    change_column_default :score_cards, :leader_points, 0
    change_column_default :score_cards, :fleet_points, 0
    change_column_default :score_cards, :babel_tiles_played, 0
    change_column_default :score_cards, :great_project_token_points, 0
    change_column_default :score_cards, :great_project_penalty_total, 0
  end
end
