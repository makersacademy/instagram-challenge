class PostsController < ApplicationController

  def index
    @posts = Post.all
    @users = User.all
  end

  def new
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
    @users = User.all
  end

  def create
    @post = Post.new(post_params.merge(post_params))
    if @post.save
      @post.update(user_id: current_user.id)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end