Rails.application.routes.draw do

  resources :cars, only: %i[index new edit create update destroy show]



root 'pages#index'

end
