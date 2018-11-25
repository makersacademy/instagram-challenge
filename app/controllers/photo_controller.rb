class PhotoController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new

  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def store
    @value = Cloudinary::Uploader.upload(params[:image])
    @post = current_user.posts.build(
      :link => @value['secure_url'],
      :caption => params[:caption]
    )
    # @post = Post.new({
    #   :link => @value['secure_url'],
    #   :caption => params[:caption],
    #   :user_id => params[:user_id]
    #   })
    @post.save
    redirect_to('/photo/index')
  end
end
