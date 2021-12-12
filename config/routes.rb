# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  namespace :v1, defaults: { format: :json } do
    resources :recipes
  end
end
