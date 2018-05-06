Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get '/profile' => 'profile#index'
  get '/profile/:user_id' => 'profile#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/skills' => 'challenge#index'
  post '/abc' => 'challenge#blablabla'

  get '/evaluate' => 'evaluate#index'
  post '/evaluate' => 'evaluate#create'

  get '/challenge' => 'real_challenge#index'

  get '/search' => 'search#index'
end
