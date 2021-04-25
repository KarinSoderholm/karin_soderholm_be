Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :welcome, :path => '/', only: :index

  namespace :admin do
    resources :dashboard, :path => '/', only: :index
    resources :requirements
    resources :tools
    resources :patterns
    resources :fabrics
    resources :artshow_artworks
    resources :artshows
    resources :artist_statements
    resources :materials
    resources :classrooms do
      collection { post :import }
      get '/alert' => :alert
    end
    resources :artworks do
      collection { post :import }
      get '/alert' => :alert
    end
    resources :clothings do
      collection { post :import }
      get '/alert' => :alert
    end
    resources :users do
      get '/edit_password' => :edit_password
      get '/profile_edit/:user_id' => :profile_edit
    end
    resource :orders do
      patch '/:id/ship', action: :ship
      get '/:id/fulfill/:order_item_id', action: :fulfill
    end
    resources :emails do
      collection { post :import }
      get '/alert' => :alert
    end
    resources :profiles do
      get '/edit_password' => :edit_password
    end
  end

  scope controller: :sessions do
    get '/login' => :new
    post '/login' => :login
    get '/logout' => :logout
  end

  resources :users, only: [:create, :update]

  scope controller: :users do
    get 'registration' => :new, as: :registration
    patch '/user/:id' => :update
    get '/profile' => :show
    get '/profile/edit' => :edit
    get '/profile/edit_password' => :edit_password
  end

  scope controller: :orders, module: 'user' do
    post '/orders' => :create
    get '/profile/orders' => :index
    get '/profile/orders/:id' => :show
    delete '/profile/orders/:id' => :cancel
  end

  resource :cart, only: [:show], controller: 'cart' do
    post ':item_id', :action => 'add_item'
    delete '', :action => 'empty'
    patch ':change/:item_id', :action => 'update_quantity'
    delete ':item_id', :action => 'remove_item'
  end

  resources :classrooms
  resources :artworks
  resources :clothings
  resources :emails
end
