Rails.application.routes.draw do

  devise_for :users

  resources :restaurants do
    resources :reviews, only: [:new, :create, :edit, :update]
  end

  root 'restaurants#index'
end
