class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts=Post.all
  end

  def new
    @post=Post.new
  end

  def create
    @post = Post.new(post_params)
    current_user.posts << @post
      if @post.save
        redirect_to posts_path
      else
        render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted'
    redirect_to posts_path
  end


end

def post_params
    params.require(:post).permit(:caption, :image)
end
