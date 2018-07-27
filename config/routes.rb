Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals, only: [:index] do
        get '/foods', to: 'meals#show'
        post '/foods/:id', to: 'meals#create'
        delete '/foods/:id', to: 'meals#destroy'
      end
    end
  end

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end
end
