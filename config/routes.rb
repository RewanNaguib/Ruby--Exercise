Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  get '/articles/index2', to: 'articles#index2'

  resources :articles do
  resources :comments
  end
end
