Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :scripts do
    resources :documents, only: [:index, :create,] do
      get :editor, on: :collection
    end
  end

  # for new script
  get 'create_script', to: 'scripts#create', as: :create_script

  # for user auth
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end
