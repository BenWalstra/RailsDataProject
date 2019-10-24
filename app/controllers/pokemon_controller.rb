class PokemonController < ApplicationController
  def index
  end

  def show
  end

  def search_results
    @query = params[:query]
    @pokemon = Pokemon.where('name LIKE ?', "%#{@query}%")
  end
end
