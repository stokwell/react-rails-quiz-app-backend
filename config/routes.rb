Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    scope module: :v1 do

      #Probe Api
      resources :posts

      # Eventscalender Api
      get 'events', to: 'events#index'
      get 'users/:id/events', to: 'events#user_events'
      resources :events
      resources :subscribings
      get 'categories', to: 'categories#index'
      post 'authenticate', to: 'authentication#authenticate'
      resources :users

      # Cassis Api
      get 'semester_info', to: 'semesters#yml_to_json'
      get 'which_week', to: 'semesters#which_week'
      post 'return_dates', to: 'semesters#return_dates'

      # React Quiz Api
      resources :tests
      resources :questions
    end
  end

end

