MyGalery::Application.routes.draw do
  devise_for :users

  root :to => 'galleries#index'
  resources :galleries
  resources :categories do
    get 'category_list/', :to => 'categories#category_list', :as => :list
    get 'show_image/', :to => 'categories#show_image'
  end

end
