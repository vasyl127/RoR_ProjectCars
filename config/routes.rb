require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => 'sidekiq'

  resources :races
  resources :cars

  get 'about', to: 'pages#about'
  get 'faqs', to: 'pages#faqs'
  get '/trash', to: 'trash#index'
  get '/trash/:id/restore_car', to: 'trash#restore_car'
  get '/trash/:id/restore_race', to: 'trash#restore_race'
  get '/trash/clean', to: 'trash#clean_all'
  get '/trash/restore_all', to: 'trash#restore_all'
  get '/races/:id/select_car', to: 'races#select_car'
  get '/races/:id/start_race', to: 'races#start_race'
  get '/races/:race_id/add_race_car/:car_id', to: 'races#add_race_car'
  get '/races/:race_id/delete_race_car/:car_id', to: 'races#delete_race_car'

  root 'pages#index'
end
