Rails.application.routes.draw do
  root "dashboard#index"

  resources :fund_collections, except: [:show]

  resources :thalakattu_varis, only: [:index, :new, :create]

  get "reports/kalvettu", to: "reports#kalvettu", as: "reports_kalvettu"

  get "up" => "rails/health#show", as: :rails_health_check
  get "/manifest.json", to: proc { [204, {}, [""]] }
end
