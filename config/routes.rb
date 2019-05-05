Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'news#index'
resources :artists, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :songs, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :post_poems, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :post_transes, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end
