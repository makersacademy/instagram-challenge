class FilterspamsController < ApplicationController

  before_action :authenticate_user!

  def index
    @filterspams = Filterspam.all
  end

  def new
    @filterspam = Filterspam.new
  end

  def create
    filterspam = Filterspam.new(filterspam_params)
    filterspam.user = current_user
    if filterspam.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def destroy
    Filterspam.destroy(params[:id])
    redirect_to '/'
  end

  def filterspam_params
    params.require(:filterspam).permit(:comment, :image)
  end

end
