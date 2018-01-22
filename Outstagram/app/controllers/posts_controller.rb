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
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    respond_to do |format|
      if @post.save
        format.html {redirect_to '/posts'}
      else
        format.html {render :edit}
      end
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
