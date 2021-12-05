Rails.application.routes.draw do
  get '/login', to:'sessions#new'
  get '/home', to:'static_pages#home'
  get '/help', to:'static_pages#help'
  get '/contact', to:'static_pages#contact'
  get '/signup', to: 'users#new'
  root  to: 'static_pages#home'
  post '/login',to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  resources :users
end
