VirtualReality::Application.routes.draw do
  
 
  ActiveAdmin.routes(self) 
  
  devise_for :users, ActiveAdmin::Devise.config
   root 'virtual#show'
  resources :layers
  resources :textures
  resources :model_categories
  resources :model_libs
  resources :texture_categories
  resources :sky_categories
  resources :skies
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 

  #resources :plans,:constraints => {:id => /[0-9]{1,2}/}
  #resources :unity3ds  do
      #resources :infos
  #end
  
  #resources :texturecategories do
     # resources :textures
  #end
  get "get_all_plans" => "plans#all"
  get "get_plan/:wbsno" => "plans#plan"
  get "get_info/:objectname" => "unity3ds#infos"
  get "get_layers"=>"layers#all"
  #custom all 
  get "get_unity3ds/:number"=>"projects#unity3ds"
  get "get_all_unity3ds" => "unity3ds#all"
  get "get_all_names" => "unity3ds#all_names"
  # Example of regular route:
   #  get 'plans/:wbsno' => 'plans#show'

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
