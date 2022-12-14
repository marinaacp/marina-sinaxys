Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'pages#home'
  resources :jobs, only: %i[index show], shallow: true do
    resources :applys, only: %i[show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
