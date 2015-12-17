Rails.application.routes.draw do
  root 'bathrooms#index'
  resources :bathrooms, only: [:new, :index, :create, :show] do
    resources :reviews, only: [:new, :create]
  end
end
