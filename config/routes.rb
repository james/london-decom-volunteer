Rails.application.routes.draw do
  resources :volunteers do
    collection do
      get :success
    end
  end
  root 'volunteers#new'
  namespace :admin do
    resources :volunteers
  end
end
