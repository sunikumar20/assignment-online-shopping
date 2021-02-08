Rails.application.routes.draw do
  resources :products
  root 'home#index'
  get 'dashboard', to: 'dashboard#index'
  resources :carts, only: [:index, :destroy]
  resource :cart, only: [] do
    put '/add/:product_id', to: 'carts#add', as: :add_to
    put '/remove/:product_id', to: 'carts#remove', as: :remove_from
  end
  devise_for :users
  # devise_scope :user do 
  # end
#  authenticated do
#    root :to => 'dashboard#index'
#  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
