Rails.application.routes.draw do
  get 'cars', to: 'api#index'
  root 'api#index'
end
