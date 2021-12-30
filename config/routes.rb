# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  namespace :v1, defaults: { format: :json } do
    resources :recipes
    get 'my_recipes', to: 'recipes#my_recipes', as: :get_my_recipes
    resources :tags

    resources :users, only: %i[update]
    get 'me', to: 'users#me', as: :get_user_details

    resources :recipes, only: %i[delete] do
      scope module: 'recipes' do
        resource :image, only: %i[create]
      end
    end

    resource :recipe do
      scope module: 'recipes' do
        resources :favorites, only: %i[index destroy create]
      end
    end

    resources :week_plans, only: %i[create index destroy]
    resource :shopping_list, only: %i[show]

    resource :week_plan do
      scope module: 'week_plans' do
        resources :day do
          scope module: 'days' do
            resources :recipes, only: %i[destroy]
          end
        end
      end
    end
  end
end
