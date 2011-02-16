Millionmonks::Application.routes.draw do
  #resources :testests

  #resources :wisdoms

  #resource    :account,       :controller => "users"
  #resources   :users
  #resource    :user_sessions
  #resources   :wisdoms
  
  #match       'user_sessions/new'       => 'user_sessions#new',     :as => "login"
  #match       'user_sessions/destroy'   => 'user_sessions#destroy', :as => "logout"
  #match       'wisdom/vote'             => 'wisdoms#vote',           :as => "wisdom_vote"
  #match       'wisdom/splash'           => 'wisdoms#splash'
  
  #resources :users do
  #  resources :votes
  #  resources :wisdoms do
  #    resources :votes
  #  end
  #end
  
  root        :to => "wisdoms#splash"
end
