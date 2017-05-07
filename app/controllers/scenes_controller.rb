class ScenesController < ApplicationController
  def index
    @scenes = Scene.all
  end

  def new
    @scene = Scene.new
  end

  def create
    @scene = Scene.create(scene_params)
    redirect_to '/scenes'
  end

  def show
    @scene = Scene.find(params[:id])
    # require 'pry'; binding.pry
  end

  def edit
    @scene = Scene.find(params[:id])
  end

  def update
    @scene = Scene.find(params[:id])
    @scene.update(scene_params)
    redirect_to '/scenes'
  end

  def destroy
    @scene = Scene.find(params[:id])
    @scene.destroy
    flash[:notice] = "Scene deleted successfully"
    redirect_to '/scenes'
  end

  private
  def scene_params
    params.require(:scene).permit(:title)
  end
end
