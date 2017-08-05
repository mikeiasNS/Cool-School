Rails.application.routes.draw do
  root 'pages#home'

  resources :responsibles, except: [:show]
  resources :studants, except: [:show]
  resources :school_classes, except: [:show]
  resources :teachers, except: [:show]
  resources :units, except: [:show]
  resources :schools, except: [:show]
  resources :users, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
