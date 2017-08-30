class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # @post = Post.create(post_params)
    # current_user.posts << @post
    # current_user.save
    # flash[:success] = "Your post has been created!"
    # redirect_to posts_url

    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Post created!"
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
    params.require(:post).permit(:image, :caption)
  end
end
