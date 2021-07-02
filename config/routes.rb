Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :about do
    get '/bio', :action => :bio
    get '/contact', :action => :contact
    get '/cv', :action => :cv
    get '/faq', :action => :faq
  end
  namespace :artwork do
    resources :collections
  end
  resources :artwork_statements
  resources :artworks
  resources :blog_posts, only: [:index, :show]
  scope controller: :blog_posts, only: [:index, :show] do
    get '/blog_posts/:id/blog_type/:tag_id', :action => :blog_type, :as => :blog_type
    get '/blog_posts/monthly_blogs/:month_id/:year_id', :action => :monthly_blogs, :as => :monthly_blogs
  end
  scope controller: :post_comments, module: 'blog_post' do
    get '/blog_post/:blog_post_id/post_comments/new' => :new, :as => :blog_post_comments_new
    get '/blog_post/:blog_post_id/post_comments/:id' => :show, :as => :blog_post_comment
    get '/blog_post/post_comments' => :index, :as => :blog_post_comments
    post '/blog_post/:blog_post_id/post_comments' => :create, :as => :blog_post_comments_create
    get '/blog_post/:blog_post_id/post_comments/:id/edit' => :edit, :as => :blog_post_comments_edit
    post '/blog_post/:blog_post_id/post_comments/:id/edit' => :update, :as => :blog_post_comments_update
    delete '/blog_post/:blog_post_id/post_comments/:id' => :destroy, :as => :blog_post_comments_delete
  end
  resource :cart, only: [:show], controller: 'cart' do
    post 'more/classroom/:classroom_id', :action => 'add_item'
    patch 'more/clothing/:clothing_id', :action => 'add_item'
    patch 'more/artwork/:artwork_id', :action => 'add_item'
    delete '', :action => 'empty'
    patch ':change/:item_type/:item_id', :action => 'update_quantity'
    delete '/:item_type/:item_id', :action => 'remove_item'
  end
  resources :classrooms
  resources :clothings
  resources :commission_blooming_maps
  resources :emails
  scope controller: :orders, module: 'user' do
    post '/orders' => :create
    get '/profile/orders' => :index
    get '/profile/orders/:id' => :show
    delete '/profile/orders/:id' => :cancel
  end
  namespace :physical_object do
    resources :collections
  end
  resources :users, only: [:create, :update]
  scope controller: :users do
    get 'registration' => :new, as: :registration
    patch '/user/:id' => :update
    get '/profile' => :show
    get '/profile/edit' => :edit
    get '/profile/edit_password' => :edit_password
  end
  scope controller: :sessions do
    get '/login' => :new
    post '/login' => :login
    get '/logout' => :logout
  end
  resources :socials
  scope controller: :student_works do
    get '/student_works/youth' => :youth, :as => :youth_student_work
    get '/student_works/adult' => :adult, :as => :adult_student_work
    get '/student_works' => :index
    get '/student_works/:id' => :show
  end
  resources :welcome, :path => '/', only: :index
end
