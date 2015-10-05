class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
    @comment = Comment.new
  end

  def new
    @photo = current_user.photos.new
    @comment = @photo.comments.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    # @comment = @photo.comments.build(params[:content].merge({user: current_user}))
    if @photo.save
      redirect_to photos_path
    else
      flash[:alert] = 'You need to provide a photo file'
      redirect_to new_photo_path
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:picture)
  end

end
