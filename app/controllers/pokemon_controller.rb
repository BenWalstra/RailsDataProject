# frozen_string_literal: true

class PokemonController < ApplicationController
  include Pagy::Backend
  def index
    all = Pokemon.order(:name)
    @pagy, @pokemon = pagy(all, items: 10)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  # GET /pokemon/search_results
  def search_results
    @query = params[:query]
    all = Pokemon.where('name LIKE ?', "%#{@query}%")
    @pokemonCount = all.count
    @pagy, @pokemon = pagy(all, items: 10)
  end
end
