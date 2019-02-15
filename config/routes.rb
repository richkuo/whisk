Rails.application.routes.draw do
  devise_for :admins, path: 'admin'
  devise_for :users, path: 'auth'

  devise_scope :user do
    authenticated :user do
      root 'users#index'

      resources :users do
        resources :accounts do
          resources :transactions
        end
      end
    end

    unauthenticated do
      root 'devise/registrations#new'
    end
  end

  devise_scope :admin do
    authenticated :admin do
      root 'admins#index'

      resources :admins do
      end

      # TODO: move companies under admins
      resources :companies do
        post '/invite', to: 'companies#invite'
        resources :payrolls do
          resources :transactions
        end

        resources :accounts do
          resources :transactions
        end
      end

      resources :users do
        resources :accounts do
          resources :transactions
        end
      end
    end

    unauthenticated do
      root 'devise/registrations#new'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
