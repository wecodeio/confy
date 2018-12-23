Rails.application.routes.draw do
  root "home#index"

  namespace :admin do
    resources :speakers
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :speakers, only: :index
      resources :conferences, only: [:index, :show], param: :slug
      resources :talks, only: [:show], param: :slug
    end
  end

end
