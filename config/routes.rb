Rails.application.routes.draw do
	devise_for :users


	#
	#
	get 'pins/index'
 	# 
	resources :pins do
		resources :likes
	end

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'home#index'
end
