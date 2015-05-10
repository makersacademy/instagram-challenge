class PhotosController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
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
    @photo = Photo.first(params[:id])[0]
  end
end
