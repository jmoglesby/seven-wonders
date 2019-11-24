# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#index'
  devise_for :users

  # RESOURCES
  resources :game_sessions do
    resources :score_cards, only: %i[new create]
  end
end
