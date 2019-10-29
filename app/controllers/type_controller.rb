# frozen_string_literal: true

class TypeController < ApplicationController
  def index
    all = Type.order(:pokemonType)
    @pagy, @type = pagy(all, items: 10)
  end

  def show
    @type = Type.find(params[:id])
  end
end
