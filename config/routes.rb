Rails.application.routes.draw do
  get 'advertisement/index'

  get 'advertisement/show'

  get 'advertisement/new'

  get 'advertisement/create'

#  get 'posts/index'
#
#  get 'posts/show'
#
#  get 'posts/new'
#
#  get 'posts/edit'
#
#  get 'welcome/index'
#
#  get 'welcome/about'
#
  resources :posts
  resources :advertisement

  get 'about' => 'welcome#about'
#  get 'welcome/contact'

#  get 'welcome/faq'

  root "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
