Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  get 'gdp' => 'gdp#gdphome'
  get 'forum' => 'forum#forumhome'
  get 'about' => 'about#abouthome'

  # Add all CRUD routes for controllers
  
  resources :gdp
  resources :forum
end
