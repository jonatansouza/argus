DoorkeeperProvider::Application.routes.draw do
  use_doorkeeper

  devise_for :users do
    root :to => "devise/sessions#new"
  end

  namespace :api do
    namespace :v1 do
      resources :profiles
      resources :users
      get '/me' => "credentials#me"
      get '/fast' => 'fast#index'
    end
  end

  get "/users/sign_up" => "users#new"
  post "/user" => "users#create"
  get "/users/me" => "users#me"
  get "/users/edit" => "users#edit"
  put "/user.:id" => "users#update"
    
      
end
