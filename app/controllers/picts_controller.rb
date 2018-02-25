class PictsController < ApplicationController
  def index
    @picts = Pict.all
  end

  def show
    @pict = Pict.find(params[:id])
  end

  def new
    @pict = Pict.new
  end

  def create
    @pict = Pict.create(pict_params)
    if @pict.save
      flash[:success] = 'Successfully added Pict'
      redirect_to @pict
    else
      p @pict.errors.messages
      render :new
    end
  end

  private

   def pict_params
    params.require(:pict).permit(:image, :title, :answer, :hints)
  end

end
