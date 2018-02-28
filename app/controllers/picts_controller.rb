class PictsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_pict, only: [:show, :edit, :update, :destroy]

  def index
    @picts = Pict.all
  end

  def show
  end

  def new
    @pict = current_user.picts.build
  end

  def create
    @pict = current_user.picts.build(pict_params)
    if @pict.save
      flash[:success] = 'Successfully added Pict'
      redirect_to @pict
    else
      render :new
    end
  end

  def update
    if @pict.update(pict_params)
      flash[:success] = 'Successfully changed Pict'
      redirect_to @pict
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @pict.delete
    flash[:success] = 'Pict Destroyed'
    redirect_to picts_path
  end

  private

  def pict_params
    params.require(:pict).permit(:image, :title, :answer, :hints)
  end

  def find_pict
    @pict = Pict.find(params[:id])
  end
end
