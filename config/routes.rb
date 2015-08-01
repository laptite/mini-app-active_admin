Rails.application.routes.draw do
  root 'homes#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :homes

end
