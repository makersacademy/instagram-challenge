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
      render :new
    end
  end

  def update
    @pict = Pict.find(params[:id])
    if @pict.update(pict_params)
    flash[:success] = 'Successfully changed Pict'
    redirect_to @pict
    else
    render :edit
    end
  end

  def edit
    @pict = Pict.find(params[:id])
  end

  def destroy
    @pict =Pict.find(params[:id])
    @pict.delete
    flash[:success] = 'Pict Destroyed'
    redirect_to picts_path
  end

  private

   def pict_params
    params.require(:pict).permit(:image, :title, :answer, :hints)
  end

end
