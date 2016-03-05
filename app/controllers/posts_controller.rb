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
      redirect_to posts_path
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
    # if @restaurant.owned_by?(current_user)
      @post.update(post_params)
    # else
      # flash[:notice] = 'Sorry - you can only edit your own posts'
    # end
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:description, :image)
  end

end
