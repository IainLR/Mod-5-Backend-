Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do 
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :meals
      resources :foods
      resources :meal_plans
      resources :goals
    end
  end
end
