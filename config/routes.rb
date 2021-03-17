Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
   devise_scope :user do
    get  'users/sign_up', to: 'users/registrations#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :top, only: [:index] 

  resources :menu, only:[:index]

  resources :mypage, only: [:index, :show]

  resources :games do
    member do
      get 'easy', to: 'games#easy'
      get 'normal', to: 'games#normal'
      get 'hard', to: 'games#hard'
      get 'score', to: 'games#score'
    end
  end
  
  resources :trial, only: [:index, :show] do
    collection do
    get 'registration', to: 'trial#registration'
    end
  end  

  root 'top#index'


end
