
Rails.application.routes.draw do
  resources :articles do
    resources :donations, only: [:create]
    resources :reviews, only: [:create]
    resources :opinions, only: [:create, :update, :destroy]
  end
  devise_for :users
  root to: 'pages#home'
  get '/quizz', to: 'quizzes#new'
end
