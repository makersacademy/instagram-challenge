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
      flash[:success] = 'You made a post, yay!'
      redirect_to @post
    else
      flash[:alert] = 'Nope. Nope. You must provide an image!'
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
    # @post.update(post_params)
    # flash[:success] = 'Post\'s been updated, yo.'
    # redirect_to(post_path(@post))
    if @post.update(post_params)
      flash[:success] = 'Post\'s been updated, yo.'
      redirect_to(post_path(@post))
    else
      flash[:alert] = 'Only a pic file works here, bro.'
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
