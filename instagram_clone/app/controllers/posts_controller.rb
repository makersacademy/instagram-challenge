class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    new_params = {username: current_user.email}
    new_params.merge!(post_params)
    user = User.find(current_user.id)
    newpost = user.posts.create(new_params)
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:content, :name)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      @post.destroy
      flash[:notice] = 'Post deleted successfully'
      redirect_to "/posts/#{params[:post_id]}"
    else
      flash[:notice] = 'Only the author can delete posts'
      redirect_to '/posts'
    end  
  end

end
