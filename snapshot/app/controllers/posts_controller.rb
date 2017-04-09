class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
      @post = current_user.posts.build
    end

    def create
      @post = current_user.posts.build(post_params)
    if @post.save
      # redirects to the newly created post
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
 # Below is to explicitly state which params the controller will accept.
  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
