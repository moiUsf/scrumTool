Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "projekts#index"

  #get ':projekt_id', to: 'user_storys#index'

  resources :projekts
  resources :user_storys 
  resources :sprint
end
