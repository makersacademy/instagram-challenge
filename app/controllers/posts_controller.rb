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
end
