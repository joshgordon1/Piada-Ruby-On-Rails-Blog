Rails.application.routes.draw do

  # Defines the root path route ("/")
  root "blog_posts#index"

  # This is a shortcut for the following routes:
  resources :blog_posts
  # get "/blog", to: "blog#index"
  # get "/blog/new", to: "blog#new"
  # post "/blog", to: "blog#create"
  # get "/blog/:id", to: "blog#show"
  # get "/blog/:id/edit", to: "blog#edit"
  # patch "/blog/:id", to: "blog#update"
  # put "/blog/:id", to: "blog#update"
  # delete "/blog/:id", to: "blog#destroy"
  
  resource :session
  resource :sign_up
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
