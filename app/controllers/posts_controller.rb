class PostsController < ApplicationController
  before_action :set_post, only: [:show, :comment, :update]

  def index
    @posts = Post.all
  end

  def show
  end

  def comment
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "You created a post!"
    else
      render :new, alert: "Your post wasn't created"
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Updated'
    else
      render :comment, alert: 'Not updated'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :comment, :pictures)
  end

end
