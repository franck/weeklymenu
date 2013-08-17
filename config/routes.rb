Weeklymenu::Application.routes.draw do
  resources :menus
  resources :recipes
  root 'menus#index'
end
