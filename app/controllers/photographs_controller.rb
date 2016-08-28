class PhotographsController < ApplicationController
before_action :authenticate_user!, :except => [:index, :show]
  def index
    @photographs = Photograph.all
  end

  def new
    @photograph = Photograph.new
  end

  def create
    @photograph = Photograph.create(photograph_params)
    @photograph.user = current_user
    if @photograph.save
      redirect_to photographs_path
    else
      render 'new'
    end
  end

  def show
    @photograph = Photograph.find(params[:id])
  end

  def edit
    @photograph = Photograph.find(params[:id])
  end

  def update
    @photograph = Photograph.find(params[:id])
    @photograph.update(photograph_params)
    redirect_to photographs_path
  end

  def destroy
    @photograph = Photograph.find(params[:id])
    @photograph.destroy
    flash[:notice] = 'Photograph deleted successfully'
    redirect_to photographs_path
  end

  private

  def photograph_params
    params.require(:photograph).permit(:image, :name )
  end
end
