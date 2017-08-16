Rails.application.routes.draw do
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

  get 'about' => 'welcome#about'
#  get 'welcome/contact'
    
#  get 'welcome/faq'
    
  root "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
