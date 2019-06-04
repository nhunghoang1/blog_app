Rails.application.routes.draw do
  devise_for :users
  
  get 'welcome/index'

  get 'tags/:tag', to: 'articles#index', as: :tag

    resources :tags 

    resources :articles do
      resources :comments
    end


  root 'articles#index'
end
