EvalPP7P8::Application.routes.draw do

  resources :studentsets

  resources :questionsets

  resources :entries

  resources :categories

  resources :affectations

  resources :periods

  resources :years

  resources :questions


  resources :terms do
    get 'activate'
    post 'activate'
  end

  resources :teams

  resources :roles

  resources :students

  resources :uploads

  resources :rates do
    collection do
      get 'save'
      post 'save'
      get 'select'
      post 'select'
    end
  end

  resources :evaluations do
    collection do
      get 'select'
      post 'select'
    end
  end
  match 'evaluations/:period_id/:user_id' => 'details#index', :as => :detail
  match 'exports/:id' => 'exports#index', :as => :export
  match 'uploads/upload' => 'uploads#upload', :as => :upload
  match 'home' => 'home#index', :as => :home



  root :to => 'guess#index'

  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'registrations#update', :as => 'user_registration'
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
