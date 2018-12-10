Rails.application.routes.draw do

  #Root view to the home controller home action
  root 'home#home'
  #Contact routes
  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'

  #Events CRUD routes
  resources :events

  #Ticket routes
  get 'tickets/get/:event_id', to: 'ticket#get'
  post 'request_ticket', to: 'ticket#request_ticket'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
