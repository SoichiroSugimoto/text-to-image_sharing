Rails.application.routes.draw do
  get 'users/index'
  get 'posts/index'
  root 'static_pages#home'
  resources :users
end
