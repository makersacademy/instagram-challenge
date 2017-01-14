class PhotographsController < ApplicationController

  def index
    @photographs = Photograph.all
  end

  def new
  end

  def create
    Photograph.create(photograph_params)
    redirect_to '/photographs'
  end

  private

  def photograph_params
    params.require(:photograph).permit(:description)
  end

end
