Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  namespace :customers do
    resources :customers, only: [:show, :edit, :update]
    patch 'customers/out' => 'customers#out', as: :customers_out
    get 'customers/out_show' => 'customers#out_show'
    resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  end

  root to: 'homes#top'

end
