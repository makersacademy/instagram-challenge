class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'Your image was uploaded!'
      redirect_to @post
    else
      flash[:notice] = 'You need to upload an image to post!'
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:caption,:image)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.owned_by?(current_user)
      if @post.update(post_params)
        flash[:notice] = 'Your post has been updated!'
        redirect_to post_path(@post)
      else
        flash[:notice] = "You did not attach an image in the correct format! Please try again!"
        render 'edit'
      end
    else
      flash[:notice] = 'You cannot edit this post, it is not yours'
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.owned_by?(current_user)
      @post.destroy
      flash[:notice] = 'Your post has been deleted!'
    else
      flash[:notice] = "You cannot delete this post, it is not yours"
    end
    redirect_to posts_path
  end

end
