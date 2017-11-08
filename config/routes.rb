Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/posts/search', to: 'posts#search'
  resources :posts do
    resources :comments
  end

  get '/admin', to: 'admin#index'
  root 'home#index'
end
