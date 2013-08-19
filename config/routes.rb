Weeklymenu::Application.routes.draw do
  resources :menus do
    member do
      post :reset
    end
    resources :days
  end
  resources :recipes
  root 'menus#index'
end
