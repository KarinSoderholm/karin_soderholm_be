Rails.application.routes.draw do
  resources :requirements
  resources :tools
  resources :patterns
  resources :fabrics
  resources :artshow_artworks
  resources :artshows
  resources :artist_statements
  resources :materials
  resources :classrooms
  resources :artworks
  resources :clothings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
