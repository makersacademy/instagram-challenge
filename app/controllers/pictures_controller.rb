class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = current_user.pictures.new
  end

  def create
    @picture = current_user.pictures.create(picture_params)

    if @picture.save && user_signed_in?
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)

    if current_user == @picture.user
      flash[:notice] = "You have successfully updated the picture"
    else
      flash[:notice] = "Only the creator can edit the picutre"
    end
    redirect_to picture_path(@picture)
  end

  def destroy
    @picture = Picture.find(params[:id])

    if current_user == @picture.user
      @picture.destroy
      flash[:notice] = "You have successfully deleted the picture"
      redirect_to pictures_path
    else
      flash[:notice] = "Only the creator can delete the picture"
      redirect_to picture_path(@picture)
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:name, :description, :image)
  end

end
