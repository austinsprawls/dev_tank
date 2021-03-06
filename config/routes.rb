Rails.application.routes.draw do
  devise_for :lendees, controllers: {sessions: 'lendees/sessions', registrations: 'lendees/registrations'}
  devise_for :lenders, controllers: {sessions: 'lenders/sessions', registrations: 'lenders/registrations'}

  #HOME routes
  root 'home#index'
  get 'invest' => 'home#invest'
  get 'personal-loan' => 'home#personal_loan'
  get 'how-it-works' => 'home#how_it_works'
  get 'about' => 'home#about'
  post 'check-rate' => 'home#check_rate'

  #LENDEE routes
  get 'profile' => 'lendees#show_profile'
  get 'profile/:id' => 'lendees#show'
  resources :lendees, only: [:edit, :update] do
    resources :payments, only: [:show, :index, :edit, :update]
    resources :investments, only: [:show, :index]
  end
  # get 'profile/:id/edit' => 'lendees#edit'
  # put 'profile/:id/edit' => 'lendees#update'

  #LENDER routes
  get 'portfolio' => 'lenders#show'
  put 'portfolio/add-funds' => 'lenders#add_funds'
  get 'portfolio/quik-invest' => 'lenders#quik_invest'
  # get 'portfolio/quik-invest/review' => 'lenders#review_quik_invest'
  post 'portfolio/quik-invest/confirm' => 'lenders#confirm_quik_invest'
  resources :lenders, only: [:edit, :update] do
    resources :payments, only: [:show, :index]
    resources :investments, only: [:show, :index]
  end

  #LOAN routes
  resources :loans, except: [:index] do
    get :reset_filterrific, on: :collection
  end
  get 'browse-loans' => 'loans#index'

  #INVESTMENT routes
  resources :investments, only: [:create]

  #PAYMENT routes
  post 'bulk-pay' => 'payments#bulk_pay'
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
