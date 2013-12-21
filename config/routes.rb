Colibrary::Application.routes.draw do
  scope module: :web do
    root to: 'welcome#index'

    resources :users, only: [:new, :create] do
      member do
        get :confirm
      end
    end

  end
end
