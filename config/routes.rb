Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
root to: "games#index"
get "/score", to: "games#score"
get "/new", to: "games#new"
  # Defines the root path route ("/")
  # root "articles#index"
end
