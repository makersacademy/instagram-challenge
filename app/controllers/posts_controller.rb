class PostsController < ApplicationController

  def index

  end

  def new
    @post = Post.new
  end

  def create
    @post =  Post.new(post_params)
      @post.user = current_user
      if @post.save
        redirect_to posts_path
      else
        render 'new'
      end
  end


  def post_params
    params.require(:post).permit(:title)
  end

end
