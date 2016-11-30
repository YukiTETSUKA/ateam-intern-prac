Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root                    :controller => 'blogs'  , :action => 'index'

  match 'blogs'         , :controller => 'blogs'  , :action => 'index' , :via => 'get' , :as => 'blogs'
  match 'blogs'         , :controller => 'blogs'  , :action => 'create', :via => 'post'
  match 'blogs/:id'     , :controller => 'blogs'  , :action => 'show'  , :via => 'get' , :as => 'blog'
  match 'likes/:blog_id', :controller => 'blogs'  , :action => 'like'  , :via => 'post'

  match 'replies/:id'   , :controller => 'replies', :action => 'create', :via => 'post', :as => 'replies'
end
