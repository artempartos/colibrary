Colibrary::Application.routes.draw do
  scope module: :web do
    root to: 'welcome#index'

    scope :profile, as: :profile do
      root to: 'dashboard#index'
    end

    resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create] do
      member do
        get :confirm
      end
    end

  end
end
