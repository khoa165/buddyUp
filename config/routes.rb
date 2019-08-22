Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :questions, only: [:index, :show] do
    resources :responses, only: [:index]
  end

  resources :responses, only: [] do
    resources :user_responses, only: [:create]
  end

  resources :user_responses, only: :destroy

  resources :connections, only: [:index] do
    resources :messages, only: [:index]
  end
  get '/profile/show', to: 'dashboard#show'
  get '/profile/edit', to: 'dashboard#edit'
  patch '/profile', to: 'dashboard#update'
  resources :connections, only: [:index]
  # resources :dashboard, only: [:edit, :update, :show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
