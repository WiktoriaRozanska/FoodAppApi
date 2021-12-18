# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  namespace :v1, defaults: { format: :json } do
    resources :recipes
    get 'my_recipes', to: 'recipes#my_recipes', as: :get_my_recipes
    resources :tags


    resource :recipe do
      scope module: 'recipes' do
        resources :favorites, only: %i[index destroy]
      end
    end
  end
end
