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
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if current_user.owns?(@post)
      @post.update(post_params)
      flash[:notice] = 'Post updated successfully'
      redirect_to post_path(@post)
    else
      flash[:notice] = 'You must be the owner to update a post description'
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.owns?(@post)
      @post = Post.find(params[:id])
      @post.destroy
      flash[:notice] = 'Post deleted successfully'
      redirect_to posts_path
    else
      flash[:notice] = 'You must be the owner to delete a post'
      redirect_to post_path(@post)
    end
  end

  def post_params
    params.require(:post).permit(:image, :title, :description)
  end
end
