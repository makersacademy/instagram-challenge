class PostsController < ApplicationController

  def index
    @post = Post.all
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      redirect_to posts_path
    else
      redirect_back(fallback_location: new_post_url)
    end
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image, :image_cache, :color_filter)
  end

end
