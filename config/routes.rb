Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :contacts do
    resources :events, only: [:new, :create, :destroy, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
