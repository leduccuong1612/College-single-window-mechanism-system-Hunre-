Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "registrations"}
  resources :static_page
  resources :student
  resources :manager
  resources :staff
  resources :users do
    resources :requests
  end
  root "static_page#index"
end
