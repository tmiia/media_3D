Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, path: 'users'
  devise_for :admins, path: 'admins', controllers: { registrations: 'admins/registrations' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :articles
  resources :articles do
    resources :comments, only: [:new, :create]
  end

  resources :articles do
    member do
      post 'add_to_favorites'
      delete 'remove_from_favorites'
    end
  end

  resources :polls do
    member do
      post 'vote'
    end
  end

  resources :debates
  resources :debates do
    resources :debate_responses, 
  end

  match '/users/:id',     to: 'users#show',       via: 'get'
  resources :user, only: [:show]

  get :en_360, controller: :articles
  get :actus, controller: :articles

  get :debate_of_the_day, controller: :debates

  resources :categories

  get :legal, controller: :legal
  namespace :legal do
    get :cgu
    get :rgpd
  end
  root "home#index"
end
