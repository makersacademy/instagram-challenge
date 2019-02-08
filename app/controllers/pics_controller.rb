class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def show
  end

  def new  # responsible for view files - have view file
    @pic = current_user.pics.build
  end

  def create # only responible for changed made in the DB - no view files
    @pic = current_user.pics.build(pic_params)

    if @pic.save
      redirect_to @pic, notice: "Yessss, it was posted!"
    else
      render "new"
    end
  end

  def edit # responsible for view files - have view file
  end

  def update # only resposible for changed made in the DB - no view file
    if @pic.update(pic_params)
      redirect_to @pic, notice: "Congrats! Pic was updated!"
    else
      render "edit" # if fails prevents info of being lost
    end
  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description, :image)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end

end
