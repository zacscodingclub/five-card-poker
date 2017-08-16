Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :games, except: [:edit, :update] do
    resources :hands, only: [:create, :show]
  end

end
