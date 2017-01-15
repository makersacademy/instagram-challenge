class InstaPostsController < ApplicationController
  def index
    @insta_posts = Insta_post.all
  end

  def new
    @insta_post = Insta_post.new
  end

  def create
    Insta_post.create(insta_post_params)
    redirect_to '/insta_images'
  end

  def insta_post_params
    params.require(:restaurant).permit(:description, :insta_image)
  end
end
