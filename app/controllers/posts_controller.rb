# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if users_post(@post)
      @post.destroy
      redirect_to posts_url
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def users_post(post)
    post.user_id == current_user.id
  end

end
