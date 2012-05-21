LivroMania::Application.routes.draw do
  devise_for :users

  root :to => 'pages#index'
  
  post '/find', :to => 'my_books#find'
  
  get '/new_my_book', :to => 'pages#new_my_book'
  post '/create_my_book', :to => 'pages#create_my_book'
  delete '/remove_my_book/:id', :to => 'pages#remove_my_book'
  
  post '/add_desired_book', :to => 'pages#add_desired_book'
  delete '/remove_desired_book/:id', :to => 'pages#remove_desired_book'
  
  get '/messages', :to => 'messages#messages'
  post '/messages', :to => 'messages#respond_message'
  
  get '/user_profile/:id', :to => 'pages#user_profile'
  
  post '/rate', :to => 'pages#rate'
  
  resources :pages do
    get :autocomplete_book_title, :on => :collection
  end
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
