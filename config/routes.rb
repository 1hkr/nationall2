Rails.application.routes.draw do
  get 'donations/index'

  get 'donations/show'

  get 'donations/new'

  get 'donations/create'

  get 'donations/edit'

  get 'donations/update'

  get 'donations/destroy'

  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/new'

  get 'reviews/create'

  get 'reviews/edit'

  get 'reviews/update'

  get 'reviews/destroy'

  get 'categories/index'

  get 'categories/show'

  get 'categories/new'

  get 'categories/create'

  get 'categories/edit'

  get 'categories/update'

  get 'categories/destroy'

  get 'opinions/index'

  get 'opinions/show'

  get 'opinions/new'

  get 'opinions/create'

  get 'opinions/edit'

  get 'opinions/update'

  get 'opinions/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  get 'articles/index'

  get 'articles/show'

  get 'articles/new'

  get 'articles/create'

  get 'articles/edit'

  get 'articles/update'

  get 'articles/destroy'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
