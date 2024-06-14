Rails.application.routes.draw do
  namespace :staff do
    root "top#index"
  end

  namespace :admin do
    root "top#index"
  end

  namespace :customer do
    root "top#index"
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
