Millionmonks::Application.routes.draw do
  resources :wisdoms
  root :to => "wisdoms#index"
end
