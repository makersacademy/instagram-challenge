class PostsController < ApplicationController
  before_action:logged_in_user?, only:[:new, :destroy]

  def index 
    @post = Post.all
  end

  def show 
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :avatar)
  end
end
