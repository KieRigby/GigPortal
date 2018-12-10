Rails.application.routes.draw do

  #Root view to the home controller home action
  root 'home#home'
  #Contact routes
  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'

  #Events CRUD routes
  resources :events

  resources :events do
    resources :tickets, only: [:new,:create]
  end
  #Ticket routes
  # get 'tickets/get/:id', to: 'tickets#index'
  # post 'request_tickets', to: 'ticket#create'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
