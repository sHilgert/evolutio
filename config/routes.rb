Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get '/profile' => 'profile#index'
  get '/profile/:user_id' => 'profile#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/challenge' => 'challenge#index'

  get '/evaluate' => 'evaluate#index'
  post '/evaluate' => 'evaluate#create', as: :evaluate_create

  get '/search' => 'search#index'
end
