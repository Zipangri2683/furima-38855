Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  patch '/items/:id/edit', to: 'items#update'
  resources :items do
   resources :orders, only: [:index, :create]
  end
end
