Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :trips, only: :create

    namespace :stats do
      get :weekly, to: 'stats#weekly'
      get :monthly, to: 'stats#monthly'
    end
  end
end
