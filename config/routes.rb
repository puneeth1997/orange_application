Rails.application.routes.draw do



  devise_for :admins
  devise_for :users, :controllers => {:registrations => "registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'dashboard/admin_dashboard'
  get 'dashboard/user_dashboard'
  get 'list/user_list' 
  get 'list/assign_points/:id' => 'list#assign_points', as: :user_assign_points
  put 'list/update/:id' => 'list#update', as: :user_update_points
  get 'employee/employ' => 'employee#employ', as: :employee_detail
  get 'list/login' => 'list#login' , as: :login
  delete 'list/destroy/:id' => 'list#destroy', as: :user_delete
  post 'list/import' => 'list#import', as: :import_users
  get 'list/impersonate' => 'list#impersonate', as: :impersonate
  get 'list/stop_impersonate' =>'list#stop_impersonate', as: :stop_impersonate
  # You can have the root of your site routed with "root"
   root 'home#index'
  # scope '/admin' do
  #   get 'start_impersonate' => 'home#start_impersonate', as: 'start_impersonate'
  #   get 'stop_impersonating' => 'home#stop_impersonating', as: 'stop_impersonate'
  # end 
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
