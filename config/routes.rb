
Rails.application.routes.draw do
  resources :articles do
    resources :donations, only: [:create]
    resources :reviews, only: [:create]
    resources :opinions, only: [:create, :update, :destroy]
  end
  devise_for :users
  root to: 'pages#home'
  resources :quizzes, only: [:new]
  resources :categories_prefs, only: [:create]
  resource :emotion_prefs, only: [:update]
  resource :temperature_prefs, only: [:update]
end
