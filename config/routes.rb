HomeCook::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  ActiveAdmin.routes(self)

  devise_scope :user do
    post 'users/verify/:id', to: 'users/registrations#verify', as: 'verify_user_registration'
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
  root :to => 'chefs#search'
  resources :chefs do
    get :autocomplete_location, :on => :collection
  end

  resources :orders
  
  resources :home
  
  get "/coupons" => "orders#apply_coupan"
  match '/contactus', :to => 'chefs#contactus'
  match '/aboutus', :to => 'chefs#aboutus'
  match '/termscondition', :to => 'chefs#termscondition'
  match '/addcart', :to =>'chefs#addcart'
  match '/removecart', :to =>'chefs#removecart'
  match '/comingsoon', :to => 'chefs#comingsoon'

  get '/api/v1/menu', :to => 'chefs#menu_list'
  put '/api/v1/addcart', :to => 'chefs#add_to_cart'
  put '/api/v1/removecart', :to => 'chefs#remove_from_cart'
  get '/api/v1/cart', :to => 'chefs#cart'
  post '/api/v1/order', :to => 'order#create_from_api'
  get '/api/v1/coupon', :to => 'order#get_coupon'
  get '/api/v1/orders', :to => 'home#list'

  resources :feedbacks
  resources :party_orders

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
