Rails.application.routes.draw do
  root 'current_matchups#index'

  resource :players, only: :show
  resource :current_matchups, only: :index
end
