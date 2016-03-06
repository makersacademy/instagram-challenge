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
  		flash[:success] = "Your post has been created."
  		redirect_to posts_path
  	else
  		flash[:alert] = "Please attach an image to post!"
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
    @post = Post.find(params[:id])
     if @post.update(post_params)
      flash[:success] = "Post was updated"
      redirect_to posts_path
    else
      flash[:alert] = "Something is wrong with your form!"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post was deleted"
    redirect_to posts_path
  end

  private

  def post_params
  	params.require(:post).permit(:caption, :image)
  end
end
