Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :scripts do
    resources :documents, only: [:index, :create]
  end

  # for user auth
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end
