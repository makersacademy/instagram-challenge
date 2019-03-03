class PostsController < ApplicationController
  def new
    # @post = current_user.posts.build
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
