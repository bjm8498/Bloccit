Rails.application.routes.draw do


  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
  resources :posts, only: [] do

    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up-vote', as: :up_vote
    post '/down-vote' => 'votes#down-vote', as: :down_vote
  end
  resources :advertisements

  resources :questions

  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'

  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'
#  get 'welcome/contact'

  get 'welcome/faq'

  root "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
# You advertisement show view depends on their being an advertisement made, and you don't seed the db with any advertisements
#
#
# [12:13]
# and for the other one i think it is because you don't define an index
#
#
# [12:16]
# and for you to make an advertisements view with resources it needs to be `resources advertisements` not `resources: advertisement`
