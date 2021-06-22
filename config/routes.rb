Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :welcome, :path => '/', only: :index

  namespace :admin do
    resources :dashboard, :path => '/', only: :index
    scope controller: :tools, module: 'workshop' do
      get '/workshop/tools/:id' => :show
      get '/workshop/tools' => :index
      get '/workshop/tools/new/:classroom_id' => :new
      post '/workshop/tools/:classroom_id' => :create
      get '/workshop/tools/:id/edit/:classroom_id' => :edit
      post '/workshop/tools/:id/edit/:classroom_id' => :update
      delete '/workshop/tools/:id' => :destroy
    end
    scope controller: :requirements, module: 'workshop' do
      get '/workshop/requirements/:id' => :show
      get '/workshop/requirements' => :index
      get '/workshop/requirements/new/:classroom_id' => :new
      post '/workshop/requirements/new/:classroom_id' => :create
      get '/workshop/requirements/:id/edit/:classroom_id' => :edit
      post '/workshop/requirements/:id/edit/:classroom_id' => :update
      delete '/workshop/requirements/:id' => :destroy
    end
    scope controller: :artwork_statements, module: 'art' do
      get '/art/:artwork_id/artwork_statement/:id' => :show
      get '/art/:artwork_id/artwork_statement/new' => :new
      get '/art/artwork_statement' => :index
      post '/art/:artwork_id/artwork_statement' => :create
      get '/art/:artwork_id/artwork_statement/:id/edit' => :edit
      post '/art/:artwork_id/artwork_statement/:id/edit' => :update
      delete '/art/:artwork_id/artwork_statement/:id' => :destroy
    end
    resources :student_works
    resources :frequently_asked_questions
    resources :cv do
      collection { post :import }
      delete '/remove_file/:cv_file_id' => :remove_file
    end
    resources :patterns
    resources :fabrics
    resources :artshow_artworks
    resources :artshows
    resources :materials
    resources :classrooms do
      collection { post :import }
      get '/alert' => :alert
      get '/add_photos' => :add_photos
      patch '/photo_update' => :photo_update
      delete '/remove_photo/:photo_id' => :remove_photo
    end
    resources :artworks do
      collection { post :import }
      get '/add_photos' => :add_photos
      patch '/photo_update' => :photo_update
      delete '/remove_photo/:photo_id' => :remove_photo
      get '/alert' => :alert
    end
    resources :clothings do
      collection { post :import }
      get '/alert' => :alert
      get '/add_photos' => :add_photos
      patch '/photo_update' => :photo_update
      delete '/remove_photo/:photo_id' => :remove_photo
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
    resources :socials
    resources :collections do
      get '/alert' => :alert
    end
    resources :contacts do
      get '/messages' => :messages
    end
    resources :commission_blooming_maps
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
    post '/classroom/:classroom_id', :action => 'add_item'
    post '/clothing/:clothing_id', :action => 'add_item'
    post '/artwork/:artwork_id', :action => 'add_item'
    delete '', :action => 'empty'
    patch ':change/:item_id', :action => 'update_quantity'
    delete ':item_id', :action => 'remove_item'
  end

  namespace :artwork do
    resources :collections
    # resources :artwork_statements do
    #   get '/:artwork_id' => :index
    # end
  end
  namespace :physical_object do
    resources :collections
  end

  resources :classrooms
  resources :artworks
  resources :clothings
  resources :emails
  resources :about do
    get '/bio', :action => :bio
    get '/contact', :action => :contact
    get '/cv', :action => :cv
    get '/faq', :action => :faq
  end
  resources :socials
  resources :commission_blooming_maps
  resources :student_works
  resources :artwork_statements
end
