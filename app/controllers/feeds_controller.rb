class FeedsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @images = Image.all
    @user = current_user
  end

  def show
    @image = Image.find(params[:format])
    @comments = Comment.new
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.create(image_params)
    redirect_to root_path
  end

  def destroy
    @image = current_user.images.find(params[:format])
    if @image.user_id === current_user.id
      @image.destroy
    else
      flash.alert = 'Unauthorised'
    end
    redirect_to root_path
  end

  def image_params
    params.require(:image).permit(:pic)
  end

  def console_print
    p '-----------------------------------------------------'
    yield
    p '-----------------------------------------------------'
  end
end
