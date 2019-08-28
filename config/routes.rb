Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  # Default pages provided from the devise.
  devise_for :users
  # Set root for the website.
  root to: 'pages#home'
  get '/components', to: 'pages#components'
  # Questions.
  resources :questions, only: [:index]
  # Reponses.
  resources :responses, only: [] do
    # Nested create of user responses
    resources :user_responses, only: [:create]
  end
  # User responses.
  resources :user_responses, only: :destroy
  # Connections.
  resources :connections, only: [:index, :create, :show] do
    # Custom route of search
    collection do
      get 'search'
      get 'cancel'
    end
    # Nested create of user responses
    resources :messages, only: [:index, :create]
    resources :meetings, only: [:new, :create]
  end
  # Meetings
  resources :meetings, only: [:edit, :update, :destroy, :show]
  # Dashboard.
  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/profile', to: 'dashboard#show'
  get '/dashboard/profile/edit', to: 'dashboard#edit'
  patch '/dashboard', to: 'dashboard#update'
  get '/messages', to: 'dashboard#messages'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
