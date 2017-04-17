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
      flash[:alert] = 'Please choose an image'
      render :new
    end
  end

  def show_pic
    @post = Post.find(params[:id])
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
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:title, :image)
  end
end
