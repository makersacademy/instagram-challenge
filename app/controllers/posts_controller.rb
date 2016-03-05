class PostsController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def new
   @post = Post.new
  end

  def create
    Post.create(post_params)
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
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to '/posts'
  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   flash[:notice] = 'Post deleted successfully'
   redirect_to '/posts'
  end
end
