class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new 
    @post = Post.new
  end

  def create
    @user = User.find(current_user.id)
    
    if @user.posts.create(post_params)
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:post).permit(:text, :pic)
  end
end
