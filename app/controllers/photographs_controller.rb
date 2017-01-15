class PhotographsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photographs = Photograph.all
  end

  def new
      @photograph = Photograph.new
  end

  def create
      current_user.photographs.create(photograph_params)
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
