Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :questions, only: [:index, :show] do
    resources :responses, only: [:index] do
      resources :user_responses, only: [:create]
    end
  end
  resources :user_responses, only: [:create]
  get 'connections/search', to: 'connections#search'
  resources :connections, only: [:index, :create] do
    resources :messages, only: [:index]
  end
  get '/profile/show', to: 'dashboard#show'
  get '/profile/edit', to: 'dashboard#edit'
  patch '/profile', to: 'dashboard#update'
  resources :connections, only: [:index]
  # resources :dashboard, only: [:edit, :update, :show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
