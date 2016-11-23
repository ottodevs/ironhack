Rails.application.routes.draw do
  post '/sandwiches/:id/ingredients/add', to: 'sandwiches#add_ingredient'

  resources :ingredients
  resources :sandwiches, except: [:new, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
