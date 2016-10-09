class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Success!'
      redirect_to '/posts'
    else
      flash[:alert] = 'Not allowed'
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :content, :image)
  end
end
