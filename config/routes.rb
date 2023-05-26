Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, skip: [:sessions, :registrations]
  as :user do
    get 'signup', to: 'devise/registrations#new', as: :new_user_registration
    post 'signup', to: 'devise/registrations#create', as: :user_registration
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    match 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
  end
  resources :clinics do
    member do
      get :delete_by_get
      patch :restaurar, to: 'clinics#restaurar'
    end
    resources :offices
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount ActionCable.server => '/cable'
end
