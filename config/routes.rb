Rails.application.routes.draw do

  root 'welcome#index'
  devise_for :accounts

  resources :welcome, only: %i[ index ]
  get 'deposito', to: 'welcome#deposito'
  get 'saque', to: 'welcome#saque'
  get 'transferencia', to: 'welcome#transferencia'
  get 'extrato', to: 'welcome#extrato'

  resources :orders, only: %i[ create ]
  post 'deposito', to: 'orders#create'
  post 'saque', to: 'orders#create'
  post 'transferencia', to: 'orders#create'

end
