Rails.application.routes.draw do



  resources :jobs do
    collection do
      get :volunteer, :volunteer_remove
    end
  end

  get 'job/index'

  devise_for :users
  resources :users
  resources :skills



  root to: 'jobs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
