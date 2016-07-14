Rails.application.routes.draw do

  root :to => 'pages#home'

  get '/users/edit' => 'users#edit', :as => 'edit_user'
  resources :users, :except => [:edit] do
    resources :destinations
      resources :photos
  end
  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'users#login'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
