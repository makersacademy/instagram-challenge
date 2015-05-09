class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
  end

  def create
    description = params[:photo][:description]
    Photo.create(description: description)
    redirect_to '/photos'
  end
end
