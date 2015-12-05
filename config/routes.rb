Rails.application.routes.draw do
  devise_for :users
#Add a route for root to the angular action
root to: 'application#angular'
 resources :recipes, :ingredients, :users
end
