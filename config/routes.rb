# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'type/index'
  # get 'type/show'
  # get 'trainer/index'
  # get 'trainer/show'
  resources :type, :pokemon, :trainer, :move, only: %i[index show] do
    collection do
      get 'search_results'
    end
  end
  # resources :type, :pokemon, :trainer, :move, only: %i[index show]
  # get 'pokemon_types/index'
  # get 'pokemon_types/show'
  # get 'pokemon/index'
  # get 'pokemon/show'
  get '/about', to: 'about#index'
  root to: 'pokemon#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
