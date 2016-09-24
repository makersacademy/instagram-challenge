class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to profile_path(current_user.username)
    else
      render new_post_path
    end
  end

  def show
    @post = Post.find(params[:post_id])
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end

end
