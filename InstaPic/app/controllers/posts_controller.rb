class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.user = current_user
    if current_user == @post.user
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/posts'
    else
    flash[:notice] = "It's not your picture"
    render 'new'
    end
  end


private

def post_params
  params.require(:post).permit(:caption, :image)
end



end
