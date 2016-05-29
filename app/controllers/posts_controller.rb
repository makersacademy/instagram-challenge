class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to posts_path
    else
      flash.now[:alert] = "Oh no! Problem creating post, check the form"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:success] = "Post updated"
      redirect_to '/posts'
    else
      flash.now[:alert] = "Oh no! Problem updating post, check the form"
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to  '/posts'
  end


  private

    def post_params
      params.require(:post).permit(:image, :caption)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def owned_post
      unless current_user == @post.user
        flash[:alert] = "Nice try, but that post is not yours!"
        redirect_to root_path
      end
    end
end
