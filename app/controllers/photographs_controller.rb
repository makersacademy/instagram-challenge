class PhotographsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photographs = Photograph.all
  end

  def show
    @photograph = Photograph.find(params[:id])
  end

  def new
    @photograph = Photograph.new
  end

  def create
    @photograph = current_user.photographs.build(photograph_params)
    @photograph.user = current_user
    if @photograph.save
      flash[:notice] = "Photo has been successfully added"
    else
      flash[:error] = "There's been an error adding your photo"
    end
    redirect_to root_path
  end

  def edit
    @photograph = Photograph.find(params[:id])
  end

  def update
    @photograph = Photograph.find(params[:id])
    @photograph.update(photograph_params)
    redirect_to root_path
  end

  def destroy
    @photograph = Photograph.find(params[:id])
    @photograph.destroy
    flash[:notice] = "Your post was deleted successfully"
    redirect_to root_path
  end

  private

  def photograph_params
    params.require(:photograph).permit(:caption, :image)
  end

end
