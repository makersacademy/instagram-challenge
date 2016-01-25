class PostsController < ApplicationController
before_action :authenticate_user!, :except => [:index]
before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

      if @post.save
        flash[:notice] = "Posted"
        redirect_to posts_path
      else
        flash[:alert] = "You need an image to post"
        render :new
      end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
   if @post.update(post_params)
     flash[:notice] = "Updated."
     redirect_to posts_path
   else
     flash.now[:alert] = "Update failed."
     render :edit
   end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def check_owner
    @post = Post.find(params[:id])
    unless current_user == @post.user
      flash[:alert] = "That aint your post dickhead"
      redirect_to root_path
    end
  end

end
