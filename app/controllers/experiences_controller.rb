class ExperiencesController < ApplicationController
  def index
    @experience = Experience.all
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
  end

  private
  def experience_params
    params.require(:experience).permit(:image, :description)
  end
end
