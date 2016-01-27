Rails.application.routes.draw do
  root 'welcome#index'

  resources :players, only: :show
  resources :matchups, only: :index
end
