Rails.application.routes.draw do
  namespace :admin do
    resources :users do
      member do
        get 'pdfcommit'
      end
    end
  end
  devise_for :users

  get "static_pages/home"

  root :to => "static_pages#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
