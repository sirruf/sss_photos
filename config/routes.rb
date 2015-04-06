Photos::Engine.routes.draw do

  resources :galleries, only: [:index, :show]
  namespace :admin do
    resources :galleries do
      member do
        post 'render_versions'
      end
      resources :pictures, only: [:show, :create, :destroy] do
        member do
          post 'up_position'
          post 'down_position'
          post 'first_position'
          post 'last_position'
          post 'edit_name'
        end
      end
    end
  end
end
