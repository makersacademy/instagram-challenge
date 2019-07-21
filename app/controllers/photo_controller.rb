class PhotoController < ApplicationController
  def index
    @posts = Post.all
  end

  def store
    render plain: params[:caption].inspect
  end
end
