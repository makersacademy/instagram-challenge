class InstaPostsController < ApplicationController
  def index
    @insta_post = InstaPost.all
  end

  def show
    @insta_post = InstaPost.find(params[:id])
  end

  def new
  end

  def edit
    @insta_post = InstaPost.find(params[:id])
  end

  def create
    @insta_post = InstaPost.new(post_params)
    if @insta_post.save
      redirect_to @insta_post
    else
      render 'new'
    end
  end

  def update
    @insta_post = InstaPost.find(params[:id])
    if @insta_post.update(post_params)
      redirect_to @insta_post
    else
      render 'edit'
    end
  end

private

  def post_params
    params[:insta_post].permit(:title, :description)
  end
end
