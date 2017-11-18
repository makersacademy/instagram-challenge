class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      ImageUploader.new.store!(params[:image])
      redirect_to posts_path
    else
      p @post.errors
      render 'new'
    end
    # @post = Post.create(post_params)
    # redirect_to posts_path
  end

  def show
    p Post.all()
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.permit(:text, :image)
  end

end
