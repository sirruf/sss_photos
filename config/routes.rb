Photos::Engine.routes.draw do

  resources :galleries, only: [:index, :show]
  get "image" => Dragonfly.app.endpoint { |params, app|
        app.fetch_file("some/dir/#{params[:file]}").thumb(params[:size])
      }
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
