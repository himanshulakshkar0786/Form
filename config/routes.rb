Rails.application.routes.draw do

	devise_for :users, controllers: { registrations: "registrations" }

	root 'posts#index'

	resources :users, only: :show do
		member do
    		get 'posts'
  		end
	end

	resources :posts do
			member do
	    		put "like", to: "like_dislikes#like"
	    		put "dislike", to: "like_dislikes#dislike"
	  		end
		resources :comments	do
			member do
	    		put "upvote", to: "like_dislikes#upvote"
	    		put "downvote", to: "like_dislikes#downvote"
	  		end
	  	end
	end

	resources :comments do
    	resources :comments
  	end
end