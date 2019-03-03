class PostsController < ApplicationController
  before_action :authenticate_user!

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
      p current_user.id
      p "^^^Current user^^^"
      redirect_to posts_path
    else
      if @post.errors.any?
        @user.errors.each do |attribute, message|
          p attribute
          p message
          p ">>>>>>>>>ERROR<<<<<<<<<<"
        end
      end
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
