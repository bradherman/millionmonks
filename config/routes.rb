Millionmonks::Application.routes.draw do
  match       '/about'                  => 'wisdoms#about',         :as => "about"
  match       'user_sessions/new'       => 'user_sessions#new',     :as => "login"
  match       'user_sessions/destroy'   => 'user_sessions#destroy', :as => "logout"
  match       'wisdom/vote'             => 'wisdoms#vote',          :as => "wisdom_vote"
  match       'wisdoms/search'          => "wisdoms#search",        :as => "search"
  match       'wisdoms/load'            => "wisdoms#load",          :as => "load_more"
  match       'wisdom/splash'           => 'wisdoms#splash'
  
  resource    :account,       :controller => "users"
  resources   :users
  resource    :user_sessions
  resources   :wisdoms
  
  resources :users do
    resources :votes
    resources :wisdoms do
      resources :votes
    end
  end
  
  root        :to => "wisdoms#index"
end
