Rails.application.routes.draw do
  # Default pages provided from the devise.
  devise_for :users
  # Set root for the website.
  root to: 'pages#home'
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
  resources :connections, only: [:index, :create] do
    # Custom route of search
    collection do
      get 'search'
    end
    # Nested create of user responses
    resources :messages, only: [:index, :create]
  end
  # Dashboard.
  # resources :dashboard, only: [:index, :show, :edit, :update]

  # get '/profile/show', to: 'dashboard#show'
  # get '/profile/edit', to: 'dashboard#edit'
  # patch '/profile', to: 'dashboard#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
