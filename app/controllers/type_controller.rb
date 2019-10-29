# frozen_string_literal: true

class TypeController < ApplicationController
  def index
    all = Type.order(:pokemonType)
    @pagy, @type = pagy(all, items: 10)
  end

  def show
    @type = Type.find(params[:id])
    allPokemon = @type.pokemon
    @pagyPokemon, @pokemon = pagy(allPokemon, items: 10)
    allMoves = @type.moves
    @pagyMove, @move = pagy(allMoves, items: 10)
  end

  # GET /type/search_results
  def search_results
    @query = params[:query]
    all = Type.where('pokemonType LIKE ?', "%#{@query}%")
    @typeCount = all.count
    @pagy, @type = pagy(all, items: 10)
  end
end
