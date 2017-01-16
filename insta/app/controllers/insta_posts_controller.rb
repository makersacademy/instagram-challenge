class InstaPostsController < ApplicationController
  def index
    @insta_posts = InstaPost.all

  end

  def new
    @insta_post = InstaPost.new
  end

  def create
    InstaPost.create(insta_post_params)
    redirect_to '/insta_posts'
  end

  def insta_post_params
    params.require(:insta_post).permit(:description, :insta_image)
  end
end
