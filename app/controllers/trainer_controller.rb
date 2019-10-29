class TrainerController < ApplicationController
  def index
    all = Trainer.order(:name)
    @pagy, @trainer = pagy(all, items: 10)
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  # GET /trainer/search_results
  def search_results
    @query = params[:query]
    all = Trainer.where('name LIKE ?', "%#{@query}%")
    @trainerCount = all.count
    @pagy, @trainer = pagy(all, items: 10)
  end
end
