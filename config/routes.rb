Laminat::Application.routes.draw do


  root to: 'products#index'

  namespace :admin do
    resources :brands do
      resources :collections do
        resources :products
      end
    end

    resources :textures
  end

  resources :brands, only: [:index, :show] do
    resources :collections, only: [:index, :show]
  end

  resources :products, only: [:index, :show]

end
