# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  namespace :v1, defaults: { format: :json } do
    resources :recipes
    get 'my_recipes', to: 'recipes#my_recipes', as: :get_my_recipes
    resources :tags

    resources :users, only: %i[update]
    get 'me', to: 'users#me', as: :get_user_details

    resource :recipe do
      scope module: 'recipes' do
        resources :favorites, only: %i[index destroy]
        resources :week_plans, only: %i[create index destroy]
      end
    end
  end
end
