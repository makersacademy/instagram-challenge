class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user = current_user
    if @picture.save
      flash[:notice] = "Your picture has been added."
      redirect_to '/pictures'
    else render 'new'
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @picture = Picture.find(params[:id])
    unless @picture.belongs_to?(current_user)
      flash[:alert] = "Naughty! You can only edit your own pictures!"
      redirect_to "/pictures"
    end
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to '/pictures'
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "Picture has been deleted succesfully"
    redirect_to '/pictures'
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :description)
  end

end
