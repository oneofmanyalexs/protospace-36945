Rails.application.routes.draw do
  get 'comments/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "comments#index"
end
