Rails.application.routes.draw do
  resources :responsibles
  resources :studants
  resources :school_classes
  resources :teachers
  resources :units
  resources :schools
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
