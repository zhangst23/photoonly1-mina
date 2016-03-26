Rails.application.routes.draw do
  devise_for :users
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :posts do
    resources :comments

    member do
    	put "like" => "posts#upvote"
    	put "unlike" => "posts#downvote"
    end
  end

  resources :tags, only: [:index, :show]

  root 'posts#index'




end
