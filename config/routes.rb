Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      resources :posts
      resources :events
      resources :subscribings
      resources :categories
      post 'authenticate', to: 'authentication#authenticate'
    end
  end

end

