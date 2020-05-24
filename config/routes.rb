Rails.application.routes.draw do
  resources :invoices
  resources :bills
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match "create_invoice", to: 'bills#createinvoice', via: :post

  root "bills#index"
end
