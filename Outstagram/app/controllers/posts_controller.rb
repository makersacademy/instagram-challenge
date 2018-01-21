class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html {redirect_to '/posts'}
      else
        format.html {render :new}
      end
    end
  end

  def index
    @posts = Post.all
  end

  def show
    p params[:id]
    p @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
