Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "projekts#index"

  #get ':projekt_id', to: 'user_storys#index'

  resources :projekts
  resources :user_storys 
  resources :sprints
  resources :scrumboards
  resources :planpokers 
  resources :burndowncharts
  resources :sprintplans
  resources :sprintreviews
  resources :sprintretros
  resources :roadmaps

  get '/createfields', to: "planpokers#createfields"
  post '/createfields', to: "planpokers#createfields"


  get '/checkpoker', to: "planpokers#checkpoker"
  post '/checkpoker', to: "planpokers#checkpoker"


  get '/pokersuccess', to: "planpokers#pokersuccess"
  post '/pokersuccess', to: "planpokers#pokersuccess"

  get '/setsprint', to: "sprintplans#setsprint"
  post '/setsprint', to: "sprintplans#setsprint"


  get '/setreview', to: "sprintreviews#setreview"
  post '/setreview', to: "sprintreviews#setreview"

  
  get '/setretros', to: "sprintretros#setretros"
  post '/setretros', to: "sprintretros#setretros"


  

  

end
