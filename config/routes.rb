Rails.application.routes.draw do
  resources :jobs do
    collection do
      get :volunteer, :volunteer_remove
    end
  end

  get 'job/index'

  devise_for :users
  resources :users do
    collection do
      get :premium_purchase
    end
  end
  resources :skills
  resources :charges
  resources :pages

  root to: 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
