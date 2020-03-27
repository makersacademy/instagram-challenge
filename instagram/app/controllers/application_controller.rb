# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def index
    @posts = Post.all
  end

  def new; end

  def show
    @post = Post.find(params[:id])
      end

  def create
    @post = Post.new(post_params)

    @post.save
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
