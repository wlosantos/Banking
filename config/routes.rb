Rails.application.routes.draw do

  root 'welcome#index'
  devise_for :accounts

  resources :welcome, only: %i[ index ]

end
