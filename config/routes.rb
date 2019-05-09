Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'news#index'
resources :artists, shallow: true do
resources :songs do
resources :post_poems do
resources :post_trans
			end
		end
	end
end
