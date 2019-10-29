# frozen_string_literal: true

class MoveController < ApplicationController
  def index
    all = Move.order(:move)
    @pagy, @move = pagy(all, items: 10)
  end

  def show
    @move = Move.find(params[:id])
    all = @move.pokemon
    @pagy, @pokemonWithMove = pagy(all, items: 10)
  end

  # GET /move/search_results
  def search_results
    @query = params[:query]
    all = Move.where('move LIKE ?', "%#{@query}%")
    @moveCount = all.count
    @pagy, @move = pagy(all, items: 10)
  end
end
