Rails.application.routes.draw do
  root "users#index"

  resources :users, only: [:index, :show, :new, :create, :edit, :update]
end
