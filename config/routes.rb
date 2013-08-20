Weeklymenu::Application.routes.draw do
  resources :menus do
    member do
      post :reset
    end
    resources :days do
      resources :meals
    end
  end
  resources :recipes do
    collection do
      post :add_tag
      post :remove_tag
    end
  end
  resources :tags
  root 'menus#index'
end
