Rails.application.routes.draw do
  root 'players#index'

  resource :players, only: [:show]
end
