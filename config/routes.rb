Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
  end
  # resources :posts
  resources :advertisement

  get 'about' => 'welcome#about'
#  get 'welcome/contact'

#  get 'welcome/faq'

  root "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
