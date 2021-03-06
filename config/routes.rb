Rails.application.routes.draw do
  get 'category/index'
  get 'project/index'
  devise_for :users
  get 'welcome/index'
  resources :project
  resources :category
  authenticated :user do
	  root "project#index", as: "authenticated_root"
  end
  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
