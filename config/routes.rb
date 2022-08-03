Rails.application.routes.draw do
  devise_for :admins
  devise_for :employees, controllers: {
    registrations: 'employees/registrations'
  }
  

  get 'home/index'
  root to: "home#index"
  resources :qualifications
  resources :details ,only:[:show,:destroy,:update,:edit,:new,:create,:index]
  resources :leaves
  resources :salaries


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
