Rails.application.routes.draw do
  get 'contacts/create'
  get 'contacts/show'
  get 'contacts/update'
  get 'contacts/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
