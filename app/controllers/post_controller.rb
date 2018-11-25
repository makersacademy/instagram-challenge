class PostController < ApplicationController
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
    @post.save
    redirect_to('/post/index')
  end

  def upvote
  @post = Post.find(params[:post_id])
  @post.upvote_by current_user
  redirect_to('/post/index')
end

end
