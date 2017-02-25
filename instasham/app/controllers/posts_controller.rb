class PostsController < ApplicationController

  def index
    @post = Post.all
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to posts_path
    else
      render new_post
    end
  end

  def post_params
    params.require(:post).permit(:caption)
  end

end
