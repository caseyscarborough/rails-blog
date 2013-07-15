RailsBlog::Application.routes.draw do

  get '/:year/:month/:day/:slug',
      :to         => 'posts#show',
      :year       => /(19|20)\d{2}/,
      :month      => /[01]?\d/,
      :day        => /[0-3]?\d/

  get '/:year/:month/:day',
      :to         => 'posts#index',
      :year       => /(19|20)\d{2}/,
      :month      => /[01]?\d/,
      :day        => /[0-3]?\d/

  get '/:year/:month',
      :to         => 'posts#index',
      :year       => /(19|20)\d{2}/,
      :month      => /[01]?\d/

  get '/:year',
    :to   => 'posts#index',
    :year => /(19|20)\d{2}/

  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :users

  resources :posts do
    resources :comments
  end

  root 'posts#index'

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
