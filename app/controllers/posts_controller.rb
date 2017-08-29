# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.reverse
  end

  def new
  end

  def create
    post = Post.create(post_params)
    post.user = current_user
    post.save
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:picture, :description)
  end
end
