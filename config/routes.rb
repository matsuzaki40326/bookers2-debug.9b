Rails.application.routes.draw do
  get 'chats/show'
 devise_for :users

  root to: 'homes#top'
  get "home/about"=>"homes#about"
  get 'search' => 'searches#search', as: 'search'
  get 'search_category' => 'books#search_category'

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]do

   resources :post_comments, only: [:create, :destroy]

   resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update]do
   resource :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
  end

  get 'chat/:id', to: 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end