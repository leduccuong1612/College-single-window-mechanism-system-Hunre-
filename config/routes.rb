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
  get 'document_by_department' => 'document#document_by_department'
  get 'document_by_name' => 'document#document_by_name'
end
