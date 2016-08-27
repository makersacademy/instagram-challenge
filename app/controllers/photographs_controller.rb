class PhotographsController < ApplicationController

  def index
    @photographs = Photograph.all
  end

  def new
    @photograph = Photograph.new
  end

  def create
    Photograph.create(photograph_params)
    redirect_to photographs_path
  end

  private

  def photograph_params
    params.require(:photograph).permit(:image, :name )
  end
end
