class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:notice] = @post.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to posts_path unless @post.belongs_to? current_user
  end

  def update
    Post.find(params[:id]).update(post_params)
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.belongs_to? current_user
    redirect_to posts_path
  end

  def post_params
    post_params = params.require(:post).permit(:title, :description, :image)
    post_params.merge(user: current_user)
  end

end
