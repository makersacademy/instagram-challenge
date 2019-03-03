class PostsController < ApplicationController
  def new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.save
    if @post.errors.any?
      @post.errors.each do |attribute, message|
        p attribute
        p message
        p "ERRORRRRRRRR"
      end
    end
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
