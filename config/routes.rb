Rails.application.routes.draw do
  root "user#index" 
  get "user/index"     => 'user#index'
  post "user/sign_in"  => 'user#sign_in'
  get "user/sign_out" =>'user#sign_out'
  
  get"supervisor/index"  => 'supervisor#index'
  get "receptionnist/index"  => 'receptionnist#index'

  post "supervisor/creat" => 'user#creat_receptionist'
  get "supervisor/new_rec" => 'supervisor#creat'
  get "supervisor/update" => 'supervisor#update'
  post "supervisor/getupdate" => 'user#update'
  get  "supervisor/show_receptionist" => 'supervisor#show_receptionist'
  post "supervisor/add_type" => 'supervisor#add_equipment_type'
  get "supervisor/add_equip_type"=>'supervisor#add_equip_type' 
  get "supervisor/back"=>'supervisor#back'
  post "supervisor/add_equipattr"=>'supervisor#add_equipattr'
  get "supervisor/show_equipment" =>'supervisor#show_equip'
  get "supervisor/show_select" => 'supervisor#show_select'
  
  get  "equipment/update/:id"=>'equip#update_cost'
  get  "equipment/update_bpl/:id"=>'equip#update_cost_bpl'
  get "equipment/update_othr/:id"=>'equip#update_cost_othr'
  post "equipment/new_cost" => 'equip#new_cost'
  post "equipment/new_cost_othr" => 'equip#new_cost_othr'
  post "equipment/new_cost_bpl" => 'equip#new_cost_bpl'
  post "equipment/delete/:id" =>'equip#delete'
  post "equipment/reset/:id"=>'equip#reset'

  post "receptionnist/delete/:id"=>'receptionnist#delete'
  post "receptionnist/index"=> 'receptionnist#index'

  post "person/bill"=>'person#bill'
  get "update_equip"=>'receptionnist#update_equip'
  get "cost_select"=>'receptionnist#show_price'
  get "temp_add"=>'receptionnist#temp_add'
  post "delete_item/:id"=>'receptionnist#delete_item'
  post "receptionnist/print"=>'receptionnist#print'
  post "receptionnist/cancel"=>'receptionnist#cancel'
  get "receptionnist/billno"=>'receptionnist#billno'
  post "person/billcancel"=>'person#billcancel'

  get "update_billequip"=>'person#update_billequip'
  get "cost_billselect"=>'person#cost_billselect'
  get "cancel"=>'person#cancel'
  get "report_yearly"=>'category#report_yearly'
  get "report_monthly"=>'category#report_monthly'
  get "report_daily" =>'category#report_daily'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'#

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