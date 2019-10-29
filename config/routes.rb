# frozen_string_literal: true

Rails.application.routes.draw do
  resources :type, :pokemon, :trainer, :move, only: %i[index show] do
    collection do
      get 'search_results'
    end
  end
  get '/about', to: 'about#index'
  root to: 'pokemon#index'
end
