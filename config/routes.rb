Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :controller => 'blogs', :action => 'index'

  resources :blogs
  match 'likes/:blog_id' => 'blogs#like', :via => 'post'

  resources :replies
end
