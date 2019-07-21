Rails.application.routes.draw do
  get 'pins/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pins#index'
end
