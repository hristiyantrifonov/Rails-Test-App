Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # define the path to go to welcome controller and the home action of that controller
  get 'welcome/home', to: 'welcome#home'
  get 'welcome/about', to: 'welcome#about'

end
