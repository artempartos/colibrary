Colibrary::Application.routes.draw do
  scope module: :web do
    root to: 'welcome#index'

    resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create] do
      member do
        get :confirm
      end
    end

  end
end
