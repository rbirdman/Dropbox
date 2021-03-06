Src::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get "dropbox/index"
  post "dropbox/uploadFile"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root "dropbox#index"

  get "home" => "dropbox#index"
  get "home/:id" => "dropbox#index"
  get "home/:id/*dirs" => "dropbox#index"

  get "/file.file" => "dropbox#downloadFile"

  post "dropbox/index" => "dropbox#uploadFile"
  post "dropbox/createDirectory" => "dropbox#createDirectory"

  post "shared" => "dropbox#shared"


  get "shared" => "dropbox#shared" #will be deleted later
  get "shared/:id" => "dropbox#shared"
  get "shared/:id/*dirs" => "dropbox#shared"

  get "users" => "users#user-search"
  get "users/search/" => "users#searched"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"

  get "calendar" => "calender_items#calendar"
  get "calendar/:id" => "calender_items#calendar"
  post "calendar" => "calender_items#saveEvent"
  post "calendar/delete" => "calender_items#deleteEvent"


  get "to-do" => "dropbox#todo"
  post "to-do" => "dropbox#todo"

  get "signin" => "sessions#new"
  get "sessions/new" => "sessions#new"
  delete "signout" => "sessions#destroy"
  delete "sessions/:id" => "sessions#destroy"
  post "sessions" => "sessions#create"
  post "signin" => "sessions#create"

  #get '/home/:id', to: 'dropbox#home', as: 'home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'shared.html' => 'dropbox#shared'
  get 'index.html' => 'dropbox#index'
#  get 'signin.html' => 'sessions#signin'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
