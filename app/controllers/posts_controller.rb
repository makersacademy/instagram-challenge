class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(merge_params)
    if(@post.save) then redirect_to @post else render 'new' end
  end

  def index
    @posts = Post.all.order('posts.created_at DESC')
  end

  def show
    find_post
  end

  private

  def post_params
    params.require(:post).permit(:description, :user_id, :image)
  end

  def merge_params
    post_params.merge(user_id: current_user.id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
