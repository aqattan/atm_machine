Rails.application.routes.draw do
  root "atm_machines#index"
  resources :atm_machines
  resources :transactions
  resources :user_infos
  resources :accounts do
    member do
      get :new_deposit
      post :create_deposit
    end
  end
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_scope :user do
  get 'sign_in', to: 'devise/sessions#new'
end
end
