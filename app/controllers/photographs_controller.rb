class PhotographsController < ApplicationController

  def index
    @photographs = Photograph.all
  end

  def new
    @photograph = Photograph.new
  end

  def create
    Photograph.create(photograph_params)
    redirect_to '/photographs'
  end

  def destroy
    @photograph = Photograph.find(params[:id])
    @photograph.destroy
    flash[:notice] = 'Post deleted succesfully'
    redirect_to '/photographs'
  end

  private

  def photograph_params
    params.require(:photograph).permit(:description)
  end

end
