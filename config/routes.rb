Rails.application.routes.draw do
  # 
  # get 'advertisements/index'
  #
  # get 'advertisements/show'
  #
  # get 'advertisements/new'
  #
  # get 'advertisements/create'

  # get 'question/index'
  #
  # get 'question/new'
  #
  # get 'question/create'
  #
  # get 'question/show'
  #
  # get 'question/edit'
  #
  # get 'question/update'
  #
  # get 'question/destroy'

  resources :topics do
    resources :posts, except: [:index]
  end
  # resources :posts
  resources :advertisements
  #resources :advertisement
  resources :question

  get 'about' => 'welcome#about'
#  get 'welcome/contact'

#  get 'welcome/faq'

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
