Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :trips, only: :create

    namespace :stats do
      get :weekly, to: "stats#weekly"
      get :monthly, to: "stats#monthly"
    end
  end

  match "*unknown_route", :to => "application#handle_routing_error", :via => :all
end
