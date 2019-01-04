Rails.application.routes.draw do
  root "home#index"

  namespace :admin do
    resources :sessions, only: [:create]
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    resources :speakers
    resources :conferences do
      resources :talks, only: [:index] do
        collection do
          get 'edit', to: 'talks#edit'
          post 'update', to: 'talks#update'
        end
      end
    end
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :conferences, only: [:index, :show], param: :slug
      resources :talks, only: [:show], param: :slug
      resources :speakers, only: [:index, :show], param: :slug
    end
  end
end
