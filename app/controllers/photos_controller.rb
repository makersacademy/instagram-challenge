class PhotosController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @photos = Photo.all
    @comment = Comment.new
    @new_like = Like.new
  end

  def get_username(item)
    User.find(item.user_id).username
  end

  def get_user_like_id(photo, user)
    Like.find_by(photo_id: photo.id, user_id: user.id).id
  end

  def create
    Photo.create(photo_params)
    redirect_to '/photos'
  end

  def photo_params
    combined_params = params.require(:photo).permit(:image, :caption)
    combined_params['user_id'] = current_user.id
    combined_params
  end

  def show
    @photo = Photo.find(params[:id])
  end
  
  helper_method :get_username, :get_user_like_id

end
