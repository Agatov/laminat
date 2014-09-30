Laminat::Application.routes.draw do


  root to: 'products#index'

  namespace :admin do
    resources :brands do
      resources :collections do
        resources :products
      end
    end

    resources :textures
    resources :colors
  end

  namespace :panel do
    resources :orders
  end

  resources :brands, only: [:index, :show] do
    get :products, on: :member
    resources :collections, only: [:index, :show] do
      get :products, on: :member
    end
  end

  resources :products, only: [:index, :show] do
    get :by_parameters, on: :collection
    get :by_article, on: :collection
  end

  resource :cart, only: [:show, :create, :update], controller: 'cart' do
    get :clear, on: :collection
    get :remove, on: :collection
  end

  resources :cart_products do
    get :clear, on: :collection
    get :deferred, on: :collection
    post :set_asside, on: :collection
  end

  resources :orders, only: :create do
    post :fast, on: :collection
  end

end
