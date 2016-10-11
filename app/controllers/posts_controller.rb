class PostsController < ApplicationController
  
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update, :destroy]  
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new 
    @post = current_user.posts.build
  end

  def create 
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Success! Post uploaded."
      redirect_to posts_path
    else
      flash[:alert] = "You must upload an image!"
      render :new
    end
  end

  def show 
  end

  def edit
  end

  def update
    if @post.save 
      @post.update(post_params)
      redirect_to(post_path(@post))
      flash[:success] = "Success! Post updated!"
    else
      redirect_to(post_path(@post))
      flash[:alert] = "Uh oh, that wasn't updated."
    end
  end

  def destroy  
    @post.destroy
    redirect_to posts_path
    flash[:success] = "Post deleted!"
  end  

  private 

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post  
    unless current_user == @post.user
      flash[:alert] = "That isn't your post!"
      redirect_to root_path
    end
  end  

end
