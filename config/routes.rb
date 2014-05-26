Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :relations, only: [:new, :create, :destroy]
  resources :scenes, only: [:new, :show, :create, :destroy]
  resources :characters , only: [:new, :show, :create, :destroy]do
    member do
      get :add, :leave
    end
  end
  resources :chapters, only: [:new, :show, :create, :destroy]
  resources :anecdotes, only: [:new, :show, :create, :destroy]


  root  'static_pages#home'
  match '/indexchapter',  to: 'chapters#index',            via: 'get'
  match '/indexcharacter',  to: 'characters#index',            via: 'get'
  match '/indexscene',  to: 'scenes#index',            via: 'get'
  match '/indexanecdote',  to: 'anecdotes#index',            via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/scene',   to: 'scenes#new',           via: 'get'
  match '/chartoscene',   to: 'relations#newChrtoSce',           via: 'get'
  match '/scenetochap',   to: 'relations#newScetoChp',           via: 'get'
  match '/character',   to: 'characters#new',           via: 'get'
  match '/anecdote',   to: 'anecdotes#new',           via: 'get'
  match '/chapter',   to: 'chapters#new',           via: 'get'
  match '/rltnChrtoSce',   to: 'relations#createChrtoSce',           via: 'post'
  match '/rltnScetoChap',   to: 'scenes#createScetoChap',           via: 'post'
  match '/scene',   to: 'scenes#create',        via: 'post'
  match '/character',   to: 'characters#create',           via: 'post'
  match '/anecdote',   to: 'anecdotes#create',        via: 'post'
  match '/chapter',   to: 'chapters#create',           via: 'post'
 

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
