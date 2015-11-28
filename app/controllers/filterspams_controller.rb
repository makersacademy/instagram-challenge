class FilterspamsController < ApplicationController

  def index
    @filterspams = Filterspam.all
  end

  def new
    @filterspam = Filterspam.new
  end

  def create
    @filterspam = Filterspam.new(_filterspam_params)

    if @filterspam.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def _filterspam_params
    params.require(:filterspam).permit(:comment, :image)
  end

end
