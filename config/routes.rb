Rails.application.routes.draw do
  devise_for :admins
  devise_for :employees, controllers: {
    registrations: 'employees/registrations'
  }
  

  # get 'home/index'
  root to: "home#index"
  resources :qualifications
  resources :details
  resources :leaves
  resources :salaries
  get 'apply/apply_leave'
  put 'apply/update'



  # resources :status,only:[:edit,:update]
  get 'status/edit'
  put 'status/update'

  # get 'approval/dashboard'
   get 'approval/dashboard'
  put 'approval/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
