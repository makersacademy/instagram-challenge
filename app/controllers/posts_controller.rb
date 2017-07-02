require "awesome_print"
class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    result = @post.save
    puts "-------------THIS IS THE RESULT-------------"
    ap result

    if @post.save
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all.reverse
  end

  private

  def post_params
    params.require(:post).permit(:title, :avatar)
  end
end
