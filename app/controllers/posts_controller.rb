class PostsController < ApplicationController
  def new
    @post = Post.new
    "hello"
  end

  def index
    @post = Post.all 
  end

  def show
    @post = Post.find(params[:id])  
  end

  def create
    @post = Post.new(permit_post)
    if @post.save
      redirect_to @post, notice: 'Successfully uploaded!'
    else
      render :new
    end
  end

  private

  def permit_post
    params.require(:post).permit(:image, :description)
  end
end
