Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :reviews do
    resources :reviews, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :reviews, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :reviews, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
