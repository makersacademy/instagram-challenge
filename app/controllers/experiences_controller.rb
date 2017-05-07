class ExperiencesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @experiences = Experience.chronological
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = current_user.experiences.new(experience_params)
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
