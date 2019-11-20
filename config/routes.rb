Rails.application.routes.draw do
  root 'static_pages#index'
  devise_for :users

  # RESOURCES
  resources :game_sessions do
    resources :score_cards, only: [:new, :create]
  end
end
