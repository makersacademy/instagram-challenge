class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    all_pictures
  end

  def new
    new_picture
  end

  def create
    create_picture
  end

  def show
    current_picture
  end

  def edit
    check_editing_permission
  end

  def update
    update_current_picture
  end

  def destroy
    destroy_current_picture
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :image)
  end

  def all_pictures
    @pictures = Picture.all
  end

  def new_picture
    @picture = Picture.new
  end

  def create_picture
    @picture = current_user.pictures.new(picture_params)
    @picture.save
    redirect_to pictures_path
  end

  def current_picture
    @picture = Picture.find(params[:id])
  end

  def update_current_picture
    @picture = current_picture.update(picture_params)
    redirect_to picture_path
  end

  def destroy_current_picture
    current_picture.destroy
    flash[:notice] = 'Picture has been deleted'
    redirect_to pictures_path
  end

  def check_editing_permission
    unless current_user.is_owner_of?(current_picture)
      flash[:notice] = 'You cannot edit this picture'
      redirect_to picture_path
    end
    current_picture
  end
end
