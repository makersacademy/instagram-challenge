class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all.reverse
  end

  def new
    @user = User.find(current_user.id)
    @post = Post.new
  end

  def create
    user = User.find(current_user.id)
    user.posts.create(post_params)
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:message)
  end

  def show
    @post = Post.find(params[:id])
    @time_of_post = @post.created_at.strftime("Posted at %I:%M%p, %m/%d/%Y")
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      flash[:notice] = 'Cannot edit post belonging to another user'
      redirect_to '/posts'
    end
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to '/posts'
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id != current_user.id
      flash[:notice] = 'Cannot delete post belonging to another user'
    else
      post.destroy
      flash[:notice] = 'Post deleted successfully'
    end
    redirect_to '/posts'
  end
end
