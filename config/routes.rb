Rails.application.routes.draw do

  root to: 'homes#top'

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
    
    resources :books do
      resource :favorites, only: [:create, :destroy] #いいね機能追加
    end

  end

end
