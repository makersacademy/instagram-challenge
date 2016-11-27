class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to posts_path
    else
      flash[:error] = "Post hasn't been added!"
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
   @post = Post.find(params[:id])
   @post.update(post_params)
   flash[:success] = "Post updated!"
   redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to posts_path
  end

  private

  def post_params
    params[:post].permit(:name, :image)
  end

  def owned_post
     @post = Post.find(params[:id])
     unless current_user == @post.user
       flash[:alert] = "Sorry, you cannot change a post that doesn't belong to you!"
       redirect_to posts_path
     end
   end
end
