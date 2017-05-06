class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    if @experience.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  private
  def experience_params
    params.require(:experience).permit(:image, :description)
  end
end
