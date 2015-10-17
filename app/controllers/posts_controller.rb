class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:caption)
  end

end