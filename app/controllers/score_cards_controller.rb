class ScoreCardsController < ApplicationController
  before_action :set_game_session, only: [:new, :create]

  def new
    @score_card = @game_session.score_cards.new
  end

  def create
    @score_card = @game_session.score_cards.create(
      score_card_params.merge(user_id: current_user.id)
    )

    if @score_card.valid?
      redirect_to game_session_path(@game_session)
    else
      render :new
    end
  end

  private # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  def score_card_params
    params.fetch(:score_card, {}).permit(
      :user_id,
      :plus_one_military_victory_tokens,
      :plus_three_military_victory_tokens,
      :plus_five_military_victory_tokens,
      :plus_seven_military_victory_tokens,
      :minus_one_military_victory_tokens,
      :minus_two_military_victory_tokens,
      :minus_three_military_victory_tokens,
      :coin_total,
      :debt_total,
      :wonder_points,
      :blue_card_points,
      :yellow_card_points,
      :black_card_points,
      :purple_card_points,
      :tablet_symbols,
      :cog_symbols,
      :compass_symbols,
      :wildcard_symbols,
      :leader_points,
      :fleet_points,
      :babel_tiles_played,
      :great_project_token_points,
      :great_project_penalty_total
    )
  end

  def set_score_card
    @score_card ||= ScoreCard.find(params[:id])
  end

  def set_game_session
    @game_session ||= GameSession.find(params[:game_session_id])
  end
end
