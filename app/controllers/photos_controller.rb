class PhotosController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.feed.photos.build(photo_params)
    @photo.user = current_user
    if @photo.save
      flash[:notice] = "Photo has been successfully added"
    else
      flash[:error] = "There's been an error adding your photo"
    end
    redirect_to feed_path(current_user)
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def edit
    @photo = current_user.photos.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def update
    @photo = current_user.photos.find(params[:id])
    @photo.update(photo_params)
    redirect_to photo_path(@photo)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def destroy
    @photo = current_user.photos.find(params[:id])
    @photo.destroy
    flash[:notice] = "Photo has been deleted"
    redirect_to feed_path(current_user)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  private

  def photo_params
    params.require(:photo).permit(:photo_url, :description)
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "photos/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end

end
