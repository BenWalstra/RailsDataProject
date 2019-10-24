# frozen_string_literal: true

class PokemonController < ApplicationController
  include Pagy::Backend
  def index
    all = Pokemon.order(:name)
    @pagy, @pokemon = pagy(all, items: 20)
  end

  def show; end

  def search_results
    @query = params[:query]
    @pokemon = Pokemon.where('name LIKE ?', "%#{@query}%")
  end
end
