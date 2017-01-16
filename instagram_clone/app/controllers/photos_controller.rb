class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_photo, only: [:show, :edit, :update, :destroy, :like]

  def index
    @photos = Photo.all.order("created_at DESC")
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.build(photo_params)

    if @photo.save
      redirect_to @photo, notice: "Photo submitted"
    else
      render 'new'
    end

  end

  def show
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: "Photo was updated"
    else
      render 'edit'
    end
  end

  def destroy
    @photo.destroy
    redirect_to root_path
  end

  def like
    @photo.like_by current_user
    redirect_to :back
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end

  def find_photo
      @photo = Photo.find(params[:id])
  end
end
