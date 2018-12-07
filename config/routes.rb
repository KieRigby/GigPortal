Rails.application.routes.draw do
  resources :events
  #Root view to the home controller home action
  root 'home#home'
  #Contact routes
  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'

  get '/ticket/view/:id', to: 'ticket#view'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
