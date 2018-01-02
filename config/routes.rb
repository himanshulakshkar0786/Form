Rails.application.routes.draw do

	devise_for :users, controllers: { registrations: "registrations" }

	root 'posts#index'

	resources :users, only: :show

	resources :posts, except: :index do
		resources :comments
	end

end
