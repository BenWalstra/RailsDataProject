class TrainerController < ApplicationController
  def index
    all = Trainer.order(:name)
    @pagy, @trainer = pagy(all, items: 10)
  end

  def show
    @trainer = Trainer.find(params[:id])
  end
end
