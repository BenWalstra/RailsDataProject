# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pokemon_types/index'
  get 'pokemon_types/show'
  get 'pokemon/index'
  get 'pokemon/show'
  get '/about', to: 'about#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
