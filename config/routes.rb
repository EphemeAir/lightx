Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'

  # Routes for Google authentication
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
