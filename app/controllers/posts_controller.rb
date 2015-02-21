class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.picture = post_params[:picture].read
    @post.save!
    redirect_to '/posts'
  end

  def show_pic
    @post = Post.find(params[:id])
    send_data @post.picture, type: :jpg, disposition: 'inline'
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
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:title, :picture)
  end

end
