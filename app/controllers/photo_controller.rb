class PhotoController < ApplicationController

  def store
    @value = Cloudinary::Uploader.upload(params[:image])
    @post = Post.new({ :link => @value['secure_url'], :caption => params[:caption] })
    @post.save

    redirect_to('/')
  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

end
