Rails.application.routes.draw do
  #Root view to the home controller home action
  root 'home#home'
  #Contact GET route
  get 'contact', to: 'home#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
