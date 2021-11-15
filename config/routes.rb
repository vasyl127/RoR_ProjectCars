Rails.application.routes.draw do

  resources :races
  resources :cars

  get '/races/:id/select_car', to: 'races#select_car'
  get 'about', to: 'pages#about'
  get 'faqs', to: 'pages#faqs'
  get '/races/:race_id/add_race_car/:car_id', to: 'races#add_race_car'

  root 'pages#index'

end
