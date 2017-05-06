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

  private
  def scene_params
    params.require(:scene).permit(:title)
  end
end
