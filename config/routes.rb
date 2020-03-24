Rails.application.routes.draw do
  get 'next_actions_for', to: 'operations#next_actions_for'
  get 'operations', to: 'operations#index'
  post 'operations', to: 'operations#create'
end
