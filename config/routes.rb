Rails.application.routes.draw do
  get 'about/index'
  
  resources :karina_photos, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  get 'perfil', to: 'home#profile', as: :user_profile

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'karina_photos#index'
  
end
