Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :ingredients, shallow: true
    resources :doses, shallow: true
  end
  resources :ingredients, only: :destroy
  resources :doses, only: :destroy
end
