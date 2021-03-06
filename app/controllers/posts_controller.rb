class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @current_user = session[:username]
    @post = Post.new(post_params)

    if @post.save
      redirect_to "/users/#{@current_user}"
    else
      render(:new)
    end
  end

  private
  def post_params
    params.require(:post).permit(:url)
  end

end
