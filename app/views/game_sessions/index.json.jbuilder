# frozen_string_literal: true

json.array! @game_sessions, partial: 'game_sessions/game_session', as: :game_session
