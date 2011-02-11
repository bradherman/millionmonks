Millionmonks::Application.routes.draw do
  resources :wisdoms
  root :to => "wisdom#index"
end
