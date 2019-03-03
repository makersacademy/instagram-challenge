class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.build
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post has been created!"
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(post_path(@post))
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(posts_path)
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end
