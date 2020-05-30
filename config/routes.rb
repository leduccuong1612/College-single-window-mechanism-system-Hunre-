Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
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
  get 'info_by_document' => 'document#info_by_document'
  
  get 'search_document' => 'static_page#search_document'
  
  get 'chart' => 'manager#chart'
  get 'demo_by_click' => 'manager#demo_by_click'
end
