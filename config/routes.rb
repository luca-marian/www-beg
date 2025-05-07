# frozen_string_literal: true

Rails.application.routes.draw do
  resources :contacts, only: [:create]
  resources :projects, only: [] do
    collection do
      get 'list'
    end
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'

  occams_route :cms_admin, path: '/admin'
  # Ensure that this route is defined last
  occams_route :cms, path: '/'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
