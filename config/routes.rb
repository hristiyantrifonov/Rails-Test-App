Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # define the path to go to welcome controller and the home action of that controller
  root 'welcome#home'
  get 'about', to: 'welcome#about'

end
