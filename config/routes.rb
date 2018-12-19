Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    resources :speakers
  end

end
