Rails.application.routes.draw do

  resources :cars, only: %i[index new edit create update destroy]



root 'pages#index'

end
