Rails.application.routes.draw do
  resources :craft_beer_shops do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # ユーザー登録・退会
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  post '/users/:id', to: 'users#update', as: 'update_user'
  get '/users/:id', to: 'users#show', as: 'profile'
  delete '/users/:id', to: 'users#destroy', as: 'unsubscribe'

  # ログイン・ログアウト
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
