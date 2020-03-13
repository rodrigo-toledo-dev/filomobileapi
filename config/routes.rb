Rails.application.routes.draw do
  get 'operations', to: 'operations#index'
  post 'operations', to: 'operations#create'
end
