Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
   devise_scope :user do
    get  'users/sign_up', to: 'users/registrations#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :top do
    member do
      get 'menu', to: 'top#menu'
    end
  end

  resources :games do
    member do
      get 'easy', to: 'games#easy'
      get 'normal', to: 'games#normal'
      get 'hard', to: 'games#hard'
    end
  end
  
  resources :trial , only: [:index]

  root 'top#index'


end
