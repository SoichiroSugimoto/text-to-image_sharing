Rails.application.routes.draw do
  get 'posts/index'
  root  'static_pages#home'
  
  get 'posts'     => 'posts#index'
end
