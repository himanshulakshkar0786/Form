Rails.application.routes.draw do

	devise_for :users, controllers: { registrations: "registrations" }

	root 'posts#index'

	resources :users, only: :show do
		member do
    		get 'posts'
  		end
	end

	resources :posts do
		resources :comments
		
		member do
    		put "like", to: "like_dislikes#like"
    		put "dislike", to: "like_dislikes#dislike"
  		end
	end
end