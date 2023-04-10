class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to feed_path
    end
  end

  def picture
    @post = Post.find(params[:id])
    send_data(
      @post.picture,
      type: @post.content_type,
      disposition: 'inline'
    )
  end

  private

  def post_params
    params.require(:post).permit(:message, :uploaded_picture)
  end
end
