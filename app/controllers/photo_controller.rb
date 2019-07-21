class PhotoController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def store
    @value = Cloudinary::Uploader.upload(params[:image])
    @post = Post.new({:link => @value['secure_url'], :caption => params[:caption]})
    @post.save

  #  [...]
    redirect_to('/')
  #  render plain: params[:caption].inspect
  end
end
