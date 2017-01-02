Rails.application.routes.draw do
  get 'product_backlog/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "projekts#index"

  resources "projekts"
  resources "product_backlog"
end
