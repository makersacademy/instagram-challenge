class PictsController < ApplicationController
  def index
  end

  def show
    @pict = Pict.find(params[:id])
  end

  def new
    @pict = Pict.new
  end

  def create
    @pict = Pict.create(pict_params)
    flash[:success] = 'Successfully added Pict'
    p @pict.errors.messages
    redirect_to @pict
  end

  private

   def pict_params
    params.require(:pict).permit(:image, :title, :answer, :hints)
  end
end
