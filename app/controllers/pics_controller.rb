class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pics = Pic.all.order('created_at DESC')
  end

  def show
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = current_user.pics.build(pic_params)
    if @pic.save
      redirect_to @pic, notice: 'Pic was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.id == @pic.user_id
      if @pic.update(params[:pic].permit(:title, :description, :picture))
        redirect_to @pic, notice: 'Pic was successfully updated.'
      else
        render 'edit'
      end
    else
      redirect_to @pic, notice: "You can't edit pics which aren't yours."
    end
  end

  def destroy
    @pic.destroy
    redirect_to pics_url, notice: 'Pic was successfully destroyed.' 
  end

  private

  def find_pic
    @pic = Pic.find(params[:id])
  end

  def pic_params
    params.require(:pic).permit(:title, :description, :picture)
  end
end
