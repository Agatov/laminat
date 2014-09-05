Laminat::Application.routes.draw do

  namespace :admin do
    resources :brands do
      resources :collections do
        resources :products
      end
    end

    resources :textures
  end

end
