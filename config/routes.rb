Kelloggbook::Application.routes.draw do
  devise_for :users
  root to: 'users#show'
  # Routes for the Section resource:
  # CREATE
  get '/sections/new', controller: 'sections', action: 'new', as: 'new_section'
  post '/sections', controller: 'sections', action: 'create', as: 'sections'

  # READ
  get '/sections', controller: 'sections', action: 'index'
  get '/sections/:id', controller: 'sections', action: 'show', as: 'section'

  # UPDATE
  get '/sections/:id/edit', controller: 'sections', action: 'edit', as: 'edit_section'
  patch '/sections/:id', controller: 'sections', action: 'update'

  # DELETE
  delete '/sections/:id', controller: 'sections', action: 'destroy'
  #------------------------------

  # Routes for the Program resource:
  # CREATE
  get '/programs/new', controller: 'programs', action: 'new', as: 'new_program'
  post '/programs', controller: 'programs', action: 'create', as: 'programs'

  # READ
  get '/programs', controller: 'programs', action: 'index'
  get '/programs/:id', controller: 'programs', action: 'show', as: 'program'

  # UPDATE
  get '/programs/:id/edit', controller: 'programs', action: 'edit', as: 'edit_program'
  patch '/programs/:id', controller: 'programs', action: 'update'

  # DELETE
  delete '/programs/:id', controller: 'programs', action: 'destroy'
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get '/users/new', controller: 'users', action: 'new', as: 'new_user'
  post '/users', controller: 'users', action: 'create', as: 'users'

  # READ
  get '/users', controller: 'users', action: 'index'
  get '/users/:id', controller: 'users', action: 'show', as: 'user'

  # UPDATE
  get '/users/:id/edit', controller: 'users', action: 'edit', as: 'edit_user'
  patch '/users/:id', controller: 'users', action: 'update'

  # DELETE
  delete '/users/:id', controller: 'users', action: 'destroy'
  #------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
