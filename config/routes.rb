Rails.application.routes.draw do

  #Root view to the home controller home action
  root 'home#home'
  #Contact routes
  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'

  #Events CRUD routes
  resources :events

  #Nested resource routes for /event/:id/tickets/new
  resources :events do
    resources :tickets, only: [:new,:create]
  end

  #Extra ticket routes
  #For QR Code scanning:
  #get 'tickets/scan/', to: 'tickets#scan'
  #View tickets
  #resources :tickets, only: [:show]




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
