# frozen_string_literal: true

class GameSessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game_session, only: %i[show edit update destroy add_player]

  # GET /game_sessions
  # GET /game_sessions.json
  def index
    @game_sessions = GameSession.all
  end

  # GET /game_sessions/1
  # GET /game_sessions/1.json
  def show; end

  # GET /game_sessions/new
  def new
    @game_session = GameSession.new
  end

  # GET /game_sessions/1/edit
  def edit; end

  # POST /game_sessions
  # POST /game_sessions.json
  def create
    @game_session = current_user.game_sessions.create(game_session_params)
    @game_session.players << User.find(current_user.id)

    respond_to do |format|
      if @game_session.valid?
        format.html { redirect_to @game_session, notice: 'Game session was successfully created.' }
        format.json { render :show, status: :created, location: @game_session }
      else
        format.html { render :new }
        format.json { render json: @game_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_sessions/1
  # PATCH/PUT /game_sessions/1.json
  def update
    respond_to do |format|
      add_player unless game_already_includes_player
      if @game_session.update(game_session_params)
        format.html { redirect_to @game_session, notice: 'Game session was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_session }
      else
        format.html { render :edit }
        format.json { render json: @game_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_sessions/1
  # DELETE /game_sessions/1.json
  def destroy
    @game_session.destroy
    respond_to do |format|
      format.html do
        redirect_to game_sessions_url, notice: 'Game session was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  # Use callbacks to share common setup or constraints between actions.
  def set_game_session
    @game_session ||= GameSession.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_session_params
    params.fetch(:game_session, {}).permit(
      :creator_user_id,
      :teams,
      :leaders_expansion,
      :cities_expansion,
      :babel_tower_expansion,
      :babel_projects_expansion,
      :armada_expansion
    )
  end

  def game_already_includes_player
    @game_session.players.include?(current_user)
  end

  def add_player
    if @game_session.players.count < 8
      @game_session.players << User.find(current_user.id)
    end
  end
end
