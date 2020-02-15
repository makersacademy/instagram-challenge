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
    # authenticate_user
    @posts = Post.all
    @posts.each {|post| p post.image }
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  # def authenticate_user
  #   redirect_to '/' unless user_signed_in?
  # end
end

