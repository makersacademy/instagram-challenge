class PicturesController < ApplicationController

  before_action :set_picture, only: [:destroy, :like]
  before_action :authenticate_user!, :except => [:index]

  def index
    @pictures = Picture.all.reverse
  end

  def new
    @picture = current_user.pictures.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      redirect_to '/pictures'
    else
      render 'new'
    end
  end

  def destroy
    if @picture.user_id == current_user.id
      @picture.destroy
    else
      flash[:notice] = 'You cannot delete a picture that belongs to another user'
    end
    redirect_to '/pictures'
  end

  def like
    if @picture.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
   params.require(:picture).permit(:description, :image)
  end

end
