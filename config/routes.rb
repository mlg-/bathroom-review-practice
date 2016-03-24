Rails.application.routes.draw do
  root "bathrooms#index"
  resources :bathrooms, only: [:new, :create, :index, :show] do
    resources :reviews, only: [:new, :create]
  end
end
