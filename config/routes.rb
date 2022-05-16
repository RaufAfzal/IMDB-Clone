Rails.application.routes.draw do

  get 'add_to_watchlist/update'
  devise_for :users
  resources :movies do
    resources :reviews, except: [:show, :index]
  end

  root to: "movies#index"
  get 'search', to: "movies#search"
  get 'ajax/:action', to: 'ajax#:action', :defaults => { :format => 'json' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
