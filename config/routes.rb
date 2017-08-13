Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :games, except: [:edit, :update]

end
