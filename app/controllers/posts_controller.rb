class PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC').all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    current_user.posts << post
    current_user.save
    redirect_to root_path
    # if current_user.save
    #   redirect_to root_path
    # else
    #   render 'new'
    # end
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end
end
