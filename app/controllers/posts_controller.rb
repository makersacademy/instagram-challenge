class PostsController < ApplicationController

  def index
    @posts = Post.all.reverse
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(image: post_params[:image], caption: post_params[:caption], user_id: current_user.id)
    redirect_to posts_path # I think this just makes a get request to post.index, as that's where you go when you do localhost:3000/posts
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
