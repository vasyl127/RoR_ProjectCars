Rails.application.routes.draw do

  resources :cars, only: %i[index new edit create update destroy show]

  get 'drag', to: 'drag#index'
  get 'about', to: 'pages#about'
  get 'faqs', to: 'pages#faqs'


  root 'pages#index'

end
