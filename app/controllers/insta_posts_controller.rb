class InstaPostsController < ApplicationController
  def index
    @insta_post = InstaPost.all
  end

  def show
    @insta_post = InstaPost.find(params[:id])
  end

  def new
  end

  def create
  @insta_post = InstaPost.new(post_params)
  @insta_post.save
  redirect_to @insta_post
  end

private

  def post_params
    params[:insta_post].permit(:title, :description)
  end
end
