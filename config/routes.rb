Rails.application.routes.draw do
  devise_for :admins, path: 'admin'
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'users#index'
      resources :users
    end

    unauthenticated do
      root 'devise/registrations#new'
    end
  end

  devise_scope :admin do
    authenticated :admin do
      root 'admins#index'
      resources :admins
      resources :companies
    end

    unauthenticated do
      root 'devise/registrations#new'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
