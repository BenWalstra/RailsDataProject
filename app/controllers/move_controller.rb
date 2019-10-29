class MoveController < ApplicationController
  def index
    all = Move.order(:move)
    @pagy, @move = pagy(all, items: 10)
  end

  def show
    @move = Move.find(params[:id])
  end
end
