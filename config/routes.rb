Rails.application.routes.draw do
  resources :guilds
  resources :players
  resources :servers
  resources :census_plus_data
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
