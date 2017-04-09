class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
    @like = Like.new
    @comment = Comment.new
  end

  def show
    @photo = Photo.find(params[:id])
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @photo = Photo.new
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.save
    redirect_to '/photos'
  end

  def update
    @photo.update(photo_params)
    redirect_to '/photos'
  end

  def destroy
    @photo.destroy
    redirect_to '/photos'
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:caption, :location, :image)
    end
end
