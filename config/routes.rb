# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :proponents

  get '/', to: 'dashboard#index'

  get '/dashboard', to: 'dashboard#index'

  scope 'api' do
    scope 'proponents' do
      post 'calculate_inss_discount', to: 'proponents#calculate_inss_discount'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
